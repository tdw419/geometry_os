; DESCRIPTION: Renders a purple disk with center (451, 97) and radius 14.
; PLAN: r0=451(x), r1=97(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 97
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
