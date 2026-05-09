; DESCRIPTION: Places a purple circle of radius 13 at center (24, 128).
; PLAN: r0=24(x), r1=128(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 128
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
