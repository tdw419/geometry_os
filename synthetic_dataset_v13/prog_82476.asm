; DESCRIPTION: Places a black circle of radius 13 at center (72, 201).
; PLAN: r0=72(x), r1=201(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 201
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
