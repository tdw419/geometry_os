; DESCRIPTION: Renders a purple disk with center (342, 75) and radius 10.
; PLAN: r0=342(x), r1=75(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 75
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
