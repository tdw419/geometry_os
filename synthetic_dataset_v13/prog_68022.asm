; DESCRIPTION: Creates a purple circular shape at (314, 88) with radius 25.
; PLAN: r0=314(x), r1=88(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 88
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
