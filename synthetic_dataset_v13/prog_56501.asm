; DESCRIPTION: Draws a black circle centered at (201, 80) with radius 51.
; PLAN: r0=201(x), r1=80(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 80
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
