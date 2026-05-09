; DESCRIPTION: Places a purple circle of radius 62 at center (105, 123).
; PLAN: r0=105(x), r1=123(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 123
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
