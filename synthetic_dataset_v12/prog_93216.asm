; DESCRIPTION: Renders a purple disk with center (227, 82) and radius 60.
; PLAN: r0=227(x), r1=82(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 82
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
