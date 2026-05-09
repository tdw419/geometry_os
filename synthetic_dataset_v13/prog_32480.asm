; DESCRIPTION: Creates a purple circular shape at (245, 217) with radius 30.
; PLAN: r0=245(x), r1=217(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 217
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
