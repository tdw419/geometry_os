; DESCRIPTION: Renders a purple disk with center (22, 29) and radius 12.
; PLAN: r0=22(x), r1=29(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 29
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
