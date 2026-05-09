; DESCRIPTION: Renders a purple disk with center (366, 155) and radius 60.
; PLAN: r0=366(x), r1=155(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 155
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
