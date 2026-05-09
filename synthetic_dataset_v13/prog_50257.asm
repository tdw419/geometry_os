; DESCRIPTION: Places a purple circle of radius 62 at center (448, 81).
; PLAN: r0=448(x), r1=81(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 81
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
