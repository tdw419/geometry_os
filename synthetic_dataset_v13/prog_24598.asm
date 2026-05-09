; DESCRIPTION: Draws a blue circle centered at (459, 56) with radius 24.
; PLAN: r0=459(x), r1=56(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 56
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
