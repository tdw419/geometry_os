; DESCRIPTION: Renders a purple disk with center (179, 125) and radius 62.
; PLAN: r0=179(x), r1=125(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 125
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
