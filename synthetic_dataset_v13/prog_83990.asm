; DESCRIPTION: Creates a purple circular shape at (325, 131) with radius 75.
; PLAN: r0=325(x), r1=131(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 131
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
