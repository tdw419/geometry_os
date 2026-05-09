; DESCRIPTION: Draws a yellow rectangle at (136, 110) with width 109 and height 114.
; PLAN: r0=136(x), r1=110(y), r2=109(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 110
LDI r2, 109
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
