; DESCRIPTION: Renders a purple disk with center (264, 66) and radius 17.
; PLAN: r0=264(x), r1=66(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 66
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
