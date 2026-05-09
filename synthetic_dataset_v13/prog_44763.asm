; DESCRIPTION: Places a purple circle of radius 37 at center (128, 119).
; PLAN: r0=128(x), r1=119(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 119
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
