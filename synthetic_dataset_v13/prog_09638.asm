; DESCRIPTION: Renders a purple disk with center (399, 103) and radius 79.
; PLAN: r0=399(x), r1=103(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 103
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
