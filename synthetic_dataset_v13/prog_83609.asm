; DESCRIPTION: Places a purple circle of radius 15 at center (110, 76).
; PLAN: r0=110(x), r1=76(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 76
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
