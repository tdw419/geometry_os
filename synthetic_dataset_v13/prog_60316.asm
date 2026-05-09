; DESCRIPTION: Renders a purple disk with center (217, 81) and radius 39.
; PLAN: r0=217(x), r1=81(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 81
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
