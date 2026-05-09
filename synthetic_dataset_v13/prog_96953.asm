; DESCRIPTION: Renders a purple disk with center (163, 57) and radius 35.
; PLAN: r0=163(x), r1=57(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 57
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
