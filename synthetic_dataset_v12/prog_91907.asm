; DESCRIPTION: Renders a purple disk with center (119, 133) and radius 12.
; PLAN: r0=119(x), r1=133(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 133
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
