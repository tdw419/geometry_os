; DESCRIPTION: Places a black circle of radius 12 at center (366, 201).
; PLAN: r0=366(x), r1=201(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 201
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
