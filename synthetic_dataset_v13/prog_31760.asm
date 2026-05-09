; DESCRIPTION: Places a green circle of radius 56 at center (201, 130).
; PLAN: r0=201(x), r1=130(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 130
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
