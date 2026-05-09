; DESCRIPTION: Renders a purple disk with center (201, 54) and radius 17.
; PLAN: r0=201(x), r1=54(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 54
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
