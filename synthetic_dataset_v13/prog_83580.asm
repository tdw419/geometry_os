; DESCRIPTION: Draws a black circle centered at (341, 193) with radius 51.
; PLAN: r0=341(x), r1=193(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 193
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
