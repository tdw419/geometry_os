; DESCRIPTION: Creates a purple circular shape at (131, 109) with radius 21.
; PLAN: r0=131(x), r1=109(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 109
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
