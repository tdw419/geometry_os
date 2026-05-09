; DESCRIPTION: Renders a purple disk with center (40, 105) and radius 11.
; PLAN: r0=40(x), r1=105(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 105
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
