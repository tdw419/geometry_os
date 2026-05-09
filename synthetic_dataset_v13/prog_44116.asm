; DESCRIPTION: Renders a purple disk with center (342, 122) and radius 36.
; PLAN: r0=342(x), r1=122(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 122
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
