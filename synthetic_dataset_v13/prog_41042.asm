; DESCRIPTION: Draws a blue circle centered at (288, 30) with radius 11.
; PLAN: r0=288(x), r1=30(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 30
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
