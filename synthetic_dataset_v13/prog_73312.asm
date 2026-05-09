; DESCRIPTION: Renders a purple disk with center (368, 120) and radius 51.
; PLAN: r0=368(x), r1=120(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 120
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
