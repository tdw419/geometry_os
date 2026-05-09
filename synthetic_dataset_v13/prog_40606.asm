; DESCRIPTION: Renders a purple disk with center (390, 111) and radius 20.
; PLAN: r0=390(x), r1=111(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 111
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
