; DESCRIPTION: Draws a black rectangle at (155, 138) with width 29 and height 89.
; PLAN: r0=155(x), r1=138(y), r2=29(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 138
LDI r2, 29
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
