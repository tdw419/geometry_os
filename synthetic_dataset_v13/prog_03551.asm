; DESCRIPTION: Renders a blue disk with center (458, 115) and radius 51.
; PLAN: r0=458(x), r1=115(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 115
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
