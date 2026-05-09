; DESCRIPTION: Renders a purple disk with center (435, 213) and radius 22.
; PLAN: r0=435(x), r1=213(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 213
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
