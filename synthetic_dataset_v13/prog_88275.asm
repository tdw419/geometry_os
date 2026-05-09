; DESCRIPTION: Renders a purple disk with center (149, 109) and radius 15.
; PLAN: r0=149(x), r1=109(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 109
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
