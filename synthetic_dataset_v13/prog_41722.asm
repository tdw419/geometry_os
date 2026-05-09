; DESCRIPTION: Creates a black circular shape at (237, 85) with radius 66.
; PLAN: r0=237(x), r1=85(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 85
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
