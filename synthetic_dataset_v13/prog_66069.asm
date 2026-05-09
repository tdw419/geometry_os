; DESCRIPTION: Creates a black circular shape at (104, 158) with radius 76.
; PLAN: r0=104(x), r1=158(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 158
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
