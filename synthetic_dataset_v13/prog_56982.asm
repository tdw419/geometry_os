; DESCRIPTION: Places a purple circle of radius 70 at center (192, 130).
; PLAN: r0=192(x), r1=130(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 130
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
