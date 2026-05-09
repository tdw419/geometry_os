; DESCRIPTION: Draws a yellow rectangle at (207, 138) with width 43 and height 78.
; PLAN: r0=207(x), r1=138(y), r2=43(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 138
LDI r2, 43
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
