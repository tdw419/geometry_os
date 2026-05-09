; DESCRIPTION: Renders a purple disk with center (430, 65) and radius 44.
; PLAN: r0=430(x), r1=65(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 65
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
