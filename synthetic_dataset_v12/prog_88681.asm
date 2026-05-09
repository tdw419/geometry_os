; DESCRIPTION: Places a magenta circle of radius 14 at center (137, 201).
; PLAN: r0=137(x), r1=201(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 201
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
