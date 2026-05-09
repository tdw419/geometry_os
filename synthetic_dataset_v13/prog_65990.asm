; DESCRIPTION: Places a green circle of radius 23 at center (225, 201).
; PLAN: r0=225(x), r1=201(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 201
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
