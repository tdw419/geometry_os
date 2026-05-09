; DESCRIPTION: Renders a purple disk with center (67, 81) and radius 11.
; PLAN: r0=67(x), r1=81(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 81
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
