; DESCRIPTION: Renders a purple disk with center (386, 155) and radius 53.
; PLAN: r0=386(x), r1=155(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 155
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
