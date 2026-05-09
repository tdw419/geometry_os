; DESCRIPTION: Creates a black circular shape at (351, 226) with radius 23.
; PLAN: r0=351(x), r1=226(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 226
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
