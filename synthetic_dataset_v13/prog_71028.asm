; DESCRIPTION: Renders a purple disk with center (266, 99) and radius 74.
; PLAN: r0=266(x), r1=99(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 99
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
