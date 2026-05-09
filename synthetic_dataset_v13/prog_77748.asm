; DESCRIPTION: Creates a purple circular shape at (293, 92) with radius 80.
; PLAN: r0=293(x), r1=92(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 92
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
