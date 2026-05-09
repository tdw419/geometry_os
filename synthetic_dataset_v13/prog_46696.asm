; DESCRIPTION: Creates a purple circular shape at (261, 109) with radius 61.
; PLAN: r0=261(x), r1=109(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 109
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
