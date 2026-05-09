; DESCRIPTION: Draws a blue circle centered at (62, 203) with radius 22.
; PLAN: r0=62(x), r1=203(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 203
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
