; DESCRIPTION: Renders a purple disk with center (430, 119) and radius 65.
; PLAN: r0=430(x), r1=119(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 119
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
