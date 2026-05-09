; DESCRIPTION: Creates a purple circular shape at (161, 136) with radius 15.
; PLAN: r0=161(x), r1=136(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 136
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
