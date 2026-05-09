; DESCRIPTION: Renders a purple disk with center (420, 110) and radius 17.
; PLAN: r0=420(x), r1=110(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 110
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
