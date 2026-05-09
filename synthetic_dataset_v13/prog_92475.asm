; DESCRIPTION: Creates a black circular shape at (389, 68) with radius 66.
; PLAN: r0=389(x), r1=68(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 68
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
