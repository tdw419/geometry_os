; DESCRIPTION: Places a purple circle of radius 20 at center (451, 83).
; PLAN: r0=451(x), r1=83(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 83
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
