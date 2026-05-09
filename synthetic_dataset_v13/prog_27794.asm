; DESCRIPTION: Renders a purple disk with center (101, 81) and radius 31.
; PLAN: r0=101(x), r1=81(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 81
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
