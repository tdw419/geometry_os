; DESCRIPTION: Renders a purple disk with center (141, 163) and radius 28.
; PLAN: r0=141(x), r1=163(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 163
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
