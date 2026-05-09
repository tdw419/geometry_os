; DESCRIPTION: Creates a black circular shape at (129, 87) with radius 31.
; PLAN: r0=129(x), r1=87(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 87
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
