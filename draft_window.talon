# These are active when we have focus on the draft window
title:Talon Draft
-
# Replace a single word with a phrase
replace <user.draft_anchor> with <user.text>:
  user.draft_select("{draft_anchor}")
  result = user.formatted_text(text, "NOOP")
  insert(result)

# Position cursor before word
cursor <user.draft_anchor>:
  user.draft_position_caret("{draft_anchor}")

cursor before <user.draft_anchor>:
  user.draft_position_caret("{draft_anchor}")

# Position cursor after word
cursor after <user.draft_anchor>:
  user.draft_position_caret("{draft_anchor}", 1)

# Select a whole word
mark <user.draft_anchor>:
  user.draft_select("{draft_anchor}")

# Select a range of words
mark <user.draft_anchor> through <user.draft_anchor>:
  user.draft_select("{draft_anchor_1}", "{draft_anchor_2}")

# Delete a word
(clear | delete) <user.draft_anchor>:
  user.draft_select("{draft_anchor}", "", 1)
  key(backspace)

# Delete a range of words
(clear | delete) <user.draft_anchor> through <user.draft_anchor>:
  user.draft_select("{draft_anchor}", "{draft_anchor}", 1)
  key(backspace)

# Make a word title case
word title <user.draft_anchor>:
    user.draft_change_case("{draft_anchor}", "title")

# Make a word lower case
word lower <user.draft_anchor>:
    user.draft_change_case("{draft_anchor}", "lower")

# Make a word all caps case
word upper <user.draft_anchor>:
    user.draft_change_case("{draft_anchor}", "upper")
