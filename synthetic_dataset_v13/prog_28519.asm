; DESCRIPTION: Creates a black circular shape at (199, 167) with radius 66.
; PLAN: r0=199(x), r1=167(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 167
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
