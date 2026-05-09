; DESCRIPTION: Places a green circle of radius 13 at center (481, 201).
; PLAN: r0=481(x), r1=201(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 201
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
