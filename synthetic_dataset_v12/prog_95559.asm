; DESCRIPTION: Renders a purple disk with center (318, 176) and radius 43.
; PLAN: r0=318(x), r1=176(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 176
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
