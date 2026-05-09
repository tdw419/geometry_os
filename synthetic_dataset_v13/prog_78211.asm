; DESCRIPTION: Renders a purple disk with center (317, 183) and radius 47.
; PLAN: r0=317(x), r1=183(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 183
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
