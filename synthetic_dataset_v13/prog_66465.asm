; DESCRIPTION: Renders a purple disk with center (312, 171) and radius 49.
; PLAN: r0=312(x), r1=171(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 171
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
