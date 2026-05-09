; DESCRIPTION: Creates a purple circular shape at (252, 167) with radius 10.
; PLAN: r0=252(x), r1=167(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 167
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
