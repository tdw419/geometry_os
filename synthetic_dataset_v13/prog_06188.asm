; DESCRIPTION: Renders a purple disk with center (72, 175) and radius 60.
; PLAN: r0=72(x), r1=175(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 175
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
