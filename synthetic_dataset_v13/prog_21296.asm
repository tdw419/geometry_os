; DESCRIPTION: Renders a purple disk with center (49, 80) and radius 21.
; PLAN: r0=49(x), r1=80(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 80
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
