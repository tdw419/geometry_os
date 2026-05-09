; DESCRIPTION: Draws a blue circle centered at (312, 142) with radius 52.
; PLAN: r0=312(x), r1=142(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 142
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
