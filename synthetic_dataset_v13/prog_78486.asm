; DESCRIPTION: Creates a purple circular shape at (289, 85) with radius 53.
; PLAN: r0=289(x), r1=85(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 85
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
