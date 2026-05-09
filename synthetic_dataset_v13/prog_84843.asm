; DESCRIPTION: Creates a black circular shape at (64, 201) with radius 35.
; PLAN: r0=64(x), r1=201(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 201
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
