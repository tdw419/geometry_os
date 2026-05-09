; DESCRIPTION: Places a purple circle of radius 26 at center (417, 47).
; PLAN: r0=417(x), r1=47(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 47
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
