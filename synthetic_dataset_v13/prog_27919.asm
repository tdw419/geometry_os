; DESCRIPTION: Renders a purple disk with center (66, 120) and radius 25.
; PLAN: r0=66(x), r1=120(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 120
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
