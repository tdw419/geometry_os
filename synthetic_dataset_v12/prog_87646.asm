; DESCRIPTION: Draws a green rectangle at (19, 122) with width 102 and height 75.
; PLAN: r0=19(x), r1=122(y), r2=102(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 122
LDI r2, 102
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
