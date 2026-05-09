; DESCRIPTION: Renders a purple disk with center (194, 158) and radius 59.
; PLAN: r0=194(x), r1=158(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 158
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
