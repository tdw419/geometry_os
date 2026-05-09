; DESCRIPTION: Places a purple circle of radius 76 at center (155, 121).
; PLAN: r0=155(x), r1=121(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 121
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
