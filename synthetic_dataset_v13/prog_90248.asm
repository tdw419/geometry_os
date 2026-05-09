; DESCRIPTION: Draws a yellow rectangle at (55, 219) with width 110 and height 29.
; PLAN: r0=55(x), r1=219(y), r2=110(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 219
LDI r2, 110
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
