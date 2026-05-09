; DESCRIPTION: Creates a black circular shape at (351, 192) with radius 22.
; PLAN: r0=351(x), r1=192(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 192
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
