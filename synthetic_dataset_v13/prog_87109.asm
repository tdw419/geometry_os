; DESCRIPTION: Renders a purple disk with center (125, 104) and radius 49.
; PLAN: r0=125(x), r1=104(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 104
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
