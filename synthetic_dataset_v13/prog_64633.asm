; DESCRIPTION: Draws a black rectangle at (147, 55) with width 119 and height 10.
; PLAN: r0=147(x), r1=55(y), r2=119(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 55
LDI r2, 119
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
