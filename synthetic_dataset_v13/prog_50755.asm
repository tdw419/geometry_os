; DESCRIPTION: Places a purple circle of radius 22 at center (363, 83).
; PLAN: r0=363(x), r1=83(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 83
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
