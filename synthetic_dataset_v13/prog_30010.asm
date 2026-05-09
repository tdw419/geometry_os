; DESCRIPTION: Renders a purple disk with center (419, 81) and radius 48.
; PLAN: r0=419(x), r1=81(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 81
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
