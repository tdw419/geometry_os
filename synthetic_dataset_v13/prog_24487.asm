; DESCRIPTION: Creates a purple circular shape at (273, 163) with radius 69.
; PLAN: r0=273(x), r1=163(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 163
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
