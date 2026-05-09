; DESCRIPTION: Creates a purple circular shape at (407, 137) with radius 72.
; PLAN: r0=407(x), r1=137(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 137
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
