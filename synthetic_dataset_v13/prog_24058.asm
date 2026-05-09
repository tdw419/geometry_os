; DESCRIPTION: Renders a purple disk with center (422, 158) and radius 72.
; PLAN: r0=422(x), r1=158(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 158
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
