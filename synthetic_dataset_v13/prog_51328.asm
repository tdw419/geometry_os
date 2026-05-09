; DESCRIPTION: Creates a purple circular shape at (299, 176) with radius 69.
; PLAN: r0=299(x), r1=176(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 176
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
