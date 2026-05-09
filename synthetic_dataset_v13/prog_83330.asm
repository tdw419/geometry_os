; DESCRIPTION: Renders a purple disk with center (189, 89) and radius 65.
; PLAN: r0=189(x), r1=89(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 89
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
