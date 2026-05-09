; DESCRIPTION: Creates a blue circular shape at (321, 123) with radius 76.
; PLAN: r0=321(x), r1=123(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 123
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
