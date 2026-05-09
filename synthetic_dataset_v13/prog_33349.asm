; DESCRIPTION: Renders a purple disk with center (261, 65) and radius 56.
; PLAN: r0=261(x), r1=65(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 65
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
