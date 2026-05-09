; DESCRIPTION: Renders a purple disk with center (430, 125) and radius 79.
; PLAN: r0=430(x), r1=125(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 125
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
