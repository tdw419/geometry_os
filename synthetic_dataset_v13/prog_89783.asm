; DESCRIPTION: Renders a purple disk with center (456, 183) and radius 24.
; PLAN: r0=456(x), r1=183(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 183
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
