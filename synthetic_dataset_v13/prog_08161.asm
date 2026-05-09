; DESCRIPTION: Renders a purple disk with center (323, 158) and radius 63.
; PLAN: r0=323(x), r1=158(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 158
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
