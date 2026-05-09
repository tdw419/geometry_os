; DESCRIPTION: Renders a purple disk with center (379, 75) and radius 74.
; PLAN: r0=379(x), r1=75(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 75
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
