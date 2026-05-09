; DESCRIPTION: Places a purple circle of radius 31 at center (390, 161).
; PLAN: r0=390(x), r1=161(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 161
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
