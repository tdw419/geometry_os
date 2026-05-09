; DESCRIPTION: Renders a purple disk with center (306, 77) and radius 33.
; PLAN: r0=306(x), r1=77(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 77
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
