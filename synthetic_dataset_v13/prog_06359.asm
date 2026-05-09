; DESCRIPTION: Renders a purple disk with center (292, 157) and radius 40.
; PLAN: r0=292(x), r1=157(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 157
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
