; DESCRIPTION: Renders a purple disk with center (200, 83) and radius 64.
; PLAN: r0=200(x), r1=83(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 83
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
