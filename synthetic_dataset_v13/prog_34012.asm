; DESCRIPTION: Draws a black rectangle at (332, 138) with width 106 and height 37.
; PLAN: r0=332(x), r1=138(y), r2=106(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 138
LDI r2, 106
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
