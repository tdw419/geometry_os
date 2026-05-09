; DESCRIPTION: Creates a green circular shape at (351, 74) with radius 31.
; PLAN: r0=351(x), r1=74(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 74
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
