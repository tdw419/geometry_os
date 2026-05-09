; DESCRIPTION: Renders a purple disk with center (220, 134) and radius 77.
; PLAN: r0=220(x), r1=134(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 134
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
