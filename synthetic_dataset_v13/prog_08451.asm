; DESCRIPTION: Renders a purple disk with center (293, 115) and radius 53.
; PLAN: r0=293(x), r1=115(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 115
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
