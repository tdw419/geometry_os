; DESCRIPTION: Renders a purple disk with center (131, 157) and radius 11.
; PLAN: r0=131(x), r1=157(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 157
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
