; DESCRIPTION: Creates a white circular shape at (204, 201) with radius 53.
; PLAN: r0=204(x), r1=201(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 201
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
