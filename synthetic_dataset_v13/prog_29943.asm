; DESCRIPTION: Creates a black circular shape at (357, 167) with radius 40.
; PLAN: r0=357(x), r1=167(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 167
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
