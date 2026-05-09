; DESCRIPTION: Creates a black circular shape at (478, 156) with radius 27.
; PLAN: r0=478(x), r1=156(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 156
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
