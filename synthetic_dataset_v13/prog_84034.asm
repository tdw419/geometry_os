; DESCRIPTION: Creates a black circular shape at (141, 137) with radius 37.
; PLAN: r0=141(x), r1=137(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 137
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
