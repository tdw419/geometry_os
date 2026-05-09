; DESCRIPTION: Places a magenta circle of radius 42 at center (422, 201).
; PLAN: r0=422(x), r1=201(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 201
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
