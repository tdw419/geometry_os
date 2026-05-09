; DESCRIPTION: Creates a purple circular shape at (208, 109) with radius 34.
; PLAN: r0=208(x), r1=109(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 109
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
