; DESCRIPTION: Renders a purple disk with center (204, 56) and radius 53.
; PLAN: r0=204(x), r1=56(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 56
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
