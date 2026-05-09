; DESCRIPTION: Creates a purple circular shape at (401, 155) with radius 53.
; PLAN: r0=401(x), r1=155(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 155
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
