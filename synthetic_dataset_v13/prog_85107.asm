; DESCRIPTION: Renders a purple disk with center (136, 213) and radius 30.
; PLAN: r0=136(x), r1=213(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 213
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
