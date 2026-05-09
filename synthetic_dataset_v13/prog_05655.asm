; DESCRIPTION: Renders a purple disk with center (427, 75) and radius 73.
; PLAN: r0=427(x), r1=75(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 75
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
