; DESCRIPTION: Places a magenta circle of radius 32 at center (462, 201).
; PLAN: r0=462(x), r1=201(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 462
LDI r1, 201
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
