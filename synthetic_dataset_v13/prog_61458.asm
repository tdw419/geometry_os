; DESCRIPTION: Renders a purple disk with center (292, 64) and radius 56.
; PLAN: r0=292(x), r1=64(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 64
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
