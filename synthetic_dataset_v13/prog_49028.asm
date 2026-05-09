; DESCRIPTION: Creates a purple circular shape at (204, 23) with radius 18.
; PLAN: r0=204(x), r1=23(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 23
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
