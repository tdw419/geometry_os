; DESCRIPTION: Creates a black circular shape at (253, 124) with radius 30.
; PLAN: r0=253(x), r1=124(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 124
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
