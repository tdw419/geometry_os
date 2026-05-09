; DESCRIPTION: Renders a purple disk with center (90, 124) and radius 66.
; PLAN: r0=90(x), r1=124(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 124
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
