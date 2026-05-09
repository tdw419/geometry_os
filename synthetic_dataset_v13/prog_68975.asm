; DESCRIPTION: Renders a purple disk with center (98, 83) and radius 36.
; PLAN: r0=98(x), r1=83(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 83
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
