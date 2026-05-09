; DESCRIPTION: Renders a purple disk with center (85, 137) and radius 60.
; PLAN: r0=85(x), r1=137(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 137
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
