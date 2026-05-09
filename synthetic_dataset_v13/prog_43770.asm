; DESCRIPTION: Renders a purple disk with center (222, 75) and radius 51.
; PLAN: r0=222(x), r1=75(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 75
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
