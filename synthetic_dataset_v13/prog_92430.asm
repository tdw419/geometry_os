; DESCRIPTION: Renders a purple disk with center (148, 72) and radius 60.
; PLAN: r0=148(x), r1=72(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 72
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
