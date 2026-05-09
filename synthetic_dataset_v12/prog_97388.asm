; DESCRIPTION: Renders a purple disk with center (368, 85) and radius 80.
; PLAN: r0=368(x), r1=85(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 85
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
