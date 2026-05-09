; DESCRIPTION: Renders a purple disk with center (345, 118) and radius 60.
; PLAN: r0=345(x), r1=118(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 118
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
