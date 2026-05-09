; DESCRIPTION: Renders a purple disk with center (220, 40) and radius 24.
; PLAN: r0=220(x), r1=40(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 40
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
