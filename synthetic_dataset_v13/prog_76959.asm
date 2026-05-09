; DESCRIPTION: Places a purple circle of radius 13 at center (323, 48).
; PLAN: r0=323(x), r1=48(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 48
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
