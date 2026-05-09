; DESCRIPTION: Draws a yellow rectangle at (136, 81) with width 110 and height 58.
; PLAN: r0=136(x), r1=81(y), r2=110(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 81
LDI r2, 110
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
