; DESCRIPTION: Places a purple circle of radius 62 at center (273, 80).
; PLAN: r0=273(x), r1=80(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 80
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
