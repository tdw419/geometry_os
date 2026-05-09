; DESCRIPTION: Renders a purple disk with center (142, 48) and radius 37.
; PLAN: r0=142(x), r1=48(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 48
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
