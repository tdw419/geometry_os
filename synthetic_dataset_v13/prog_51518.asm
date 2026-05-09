; DESCRIPTION: Renders a purple disk with center (323, 154) and radius 73.
; PLAN: r0=323(x), r1=154(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 154
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
