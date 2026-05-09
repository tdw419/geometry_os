; DESCRIPTION: Creates a black circular shape at (177, 62) with radius 51.
; PLAN: r0=177(x), r1=62(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 62
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
