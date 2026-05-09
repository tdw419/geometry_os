; DESCRIPTION: Creates a purple circular shape at (219, 101) with radius 68.
; PLAN: r0=219(x), r1=101(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 101
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
