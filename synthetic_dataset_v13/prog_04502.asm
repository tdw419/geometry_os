; DESCRIPTION: Creates a black circular shape at (357, 163) with radius 45.
; PLAN: r0=357(x), r1=163(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 163
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
