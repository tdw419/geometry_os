; DESCRIPTION: Draws a blue circle centered at (463, 56) with radius 17.
; PLAN: r0=463(x), r1=56(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 56
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
