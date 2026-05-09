; DESCRIPTION: Places a purple circle of radius 49 at center (363, 49).
; PLAN: r0=363(x), r1=49(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 49
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
