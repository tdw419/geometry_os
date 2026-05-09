; DESCRIPTION: Draws a black circle centered at (449, 155) with radius 45.
; PLAN: r0=449(x), r1=155(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 155
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
