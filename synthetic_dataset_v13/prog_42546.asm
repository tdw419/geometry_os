; DESCRIPTION: Renders a purple disk with center (276, 130) and radius 70.
; PLAN: r0=276(x), r1=130(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 130
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
