; DESCRIPTION: Creates a purple circular shape at (453, 31) with radius 12.
; PLAN: r0=453(x), r1=31(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 31
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
