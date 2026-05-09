; DESCRIPTION: Creates a black circular shape at (417, 189) with radius 51.
; PLAN: r0=417(x), r1=189(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 189
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
