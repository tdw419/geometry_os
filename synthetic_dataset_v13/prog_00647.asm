; DESCRIPTION: Places a purple circle of radius 58 at center (155, 76).
; PLAN: r0=155(x), r1=76(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 76
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
