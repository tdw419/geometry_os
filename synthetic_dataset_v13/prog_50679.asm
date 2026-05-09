; DESCRIPTION: Renders a purple disk with center (382, 172) and radius 56.
; PLAN: r0=382(x), r1=172(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 172
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
