; DESCRIPTION: Renders a purple disk with center (139, 84) and radius 69.
; PLAN: r0=139(x), r1=84(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 84
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
