; DESCRIPTION: Creates a green circular shape at (253, 199) with radius 41.
; PLAN: r0=253(x), r1=199(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 199
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
