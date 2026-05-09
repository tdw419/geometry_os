; DESCRIPTION: Renders a purple disk with center (434, 100) and radius 75.
; PLAN: r0=434(x), r1=100(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 100
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
