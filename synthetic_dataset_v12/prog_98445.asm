; DESCRIPTION: Renders a purple disk with center (170, 122) and radius 34.
; PLAN: r0=170(x), r1=122(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 122
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
