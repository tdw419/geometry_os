; DESCRIPTION: Renders a purple disk with center (276, 122) and radius 20.
; PLAN: r0=276(x), r1=122(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 122
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
