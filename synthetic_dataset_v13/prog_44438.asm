; DESCRIPTION: Renders a purple disk with center (195, 56) and radius 21.
; PLAN: r0=195(x), r1=56(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 56
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
