; DESCRIPTION: Creates a black circular shape at (389, 87) with radius 75.
; PLAN: r0=389(x), r1=87(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 87
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
