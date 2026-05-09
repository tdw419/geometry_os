; DESCRIPTION: Renders a purple disk with center (315, 193) and radius 22.
; PLAN: r0=315(x), r1=193(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 193
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
