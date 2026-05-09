; DESCRIPTION: Renders a purple disk with center (348, 96) and radius 25.
; PLAN: r0=348(x), r1=96(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 96
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
