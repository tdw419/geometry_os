; DESCRIPTION: Renders a purple disk with center (201, 93) and radius 36.
; PLAN: r0=201(x), r1=93(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 93
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
