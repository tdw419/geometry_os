; DESCRIPTION: Draws a yellow rectangle at (136, 45) with width 118 and height 43.
; PLAN: r0=136(x), r1=45(y), r2=118(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 45
LDI r2, 118
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
