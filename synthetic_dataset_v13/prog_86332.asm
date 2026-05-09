; DESCRIPTION: Places a purple circle of radius 57 at center (351, 76).
; PLAN: r0=351(x), r1=76(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 76
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
