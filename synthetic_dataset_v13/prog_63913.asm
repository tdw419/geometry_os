; DESCRIPTION: Creates a black circular shape at (286, 167) with radius 21.
; PLAN: r0=286(x), r1=167(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 167
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
