; DESCRIPTION: Creates a black circular shape at (52, 204) with radius 31.
; PLAN: r0=52(x), r1=204(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 204
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
