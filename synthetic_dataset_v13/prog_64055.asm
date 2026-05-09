; DESCRIPTION: Renders a purple disk with center (166, 120) and radius 10.
; PLAN: r0=166(x), r1=120(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 120
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
