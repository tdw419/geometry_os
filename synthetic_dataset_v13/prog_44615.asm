; DESCRIPTION: Draws a yellow rectangle at (347, 135) with width 22 and height 119.
; PLAN: r0=347(x), r1=135(y), r2=22(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 135
LDI r2, 22
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
