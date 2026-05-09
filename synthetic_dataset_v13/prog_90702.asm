; DESCRIPTION: Renders a purple disk with center (312, 77) and radius 23.
; PLAN: r0=312(x), r1=77(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 77
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
