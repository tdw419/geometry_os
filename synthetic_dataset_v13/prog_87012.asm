; DESCRIPTION: Renders a purple disk with center (201, 75) and radius 32.
; PLAN: r0=201(x), r1=75(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 75
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
