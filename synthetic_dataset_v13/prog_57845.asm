; DESCRIPTION: Renders a purple disk with center (382, 111) and radius 52.
; PLAN: r0=382(x), r1=111(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 111
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
