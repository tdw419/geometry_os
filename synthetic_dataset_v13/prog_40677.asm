; DESCRIPTION: Places a purple circle of radius 23 at center (388, 114).
; PLAN: r0=388(x), r1=114(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 388
LDI r1, 114
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
