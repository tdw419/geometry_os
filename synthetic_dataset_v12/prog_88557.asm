; DESCRIPTION: Renders a purple disk with center (262, 114) and radius 75.
; PLAN: r0=262(x), r1=114(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 114
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
