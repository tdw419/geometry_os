; DESCRIPTION: Creates a black circular shape at (145, 78) with radius 49.
; PLAN: r0=145(x), r1=78(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 78
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
