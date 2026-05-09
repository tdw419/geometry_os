; DESCRIPTION: Creates a purple circular shape at (148, 119) with radius 69.
; PLAN: r0=148(x), r1=119(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 119
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
