; DESCRIPTION: Renders a purple disk with center (73, 157) and radius 13.
; PLAN: r0=73(x), r1=157(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 157
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
