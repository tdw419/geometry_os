; DESCRIPTION: Places a purple circle of radius 37 at center (388, 123).
; PLAN: r0=388(x), r1=123(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 123
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
