; DESCRIPTION: Places a purple circle of radius 31 at center (402, 66).
; PLAN: r0=402(x), r1=66(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 66
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
