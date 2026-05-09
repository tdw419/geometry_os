; DESCRIPTION: Places a red 69x75 rectangle at position (66, 118).
; PLAN: r0=66(x), r1=118(y), r2=69(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 118
LDI r2, 69
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
