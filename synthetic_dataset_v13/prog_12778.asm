; DESCRIPTION: Renders a purple disk with center (363, 106) and radius 74.
; PLAN: r0=363(x), r1=106(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 106
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
