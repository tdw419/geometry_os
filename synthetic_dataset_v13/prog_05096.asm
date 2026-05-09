; DESCRIPTION: Renders a purple disk with center (395, 62) and radius 51.
; PLAN: r0=395(x), r1=62(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 62
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
