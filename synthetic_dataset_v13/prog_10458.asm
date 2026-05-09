; DESCRIPTION: Creates a green circular shape at (109, 201) with radius 43.
; PLAN: r0=109(x), r1=201(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 201
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
