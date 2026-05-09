; DESCRIPTION: Renders a blue disk with center (430, 198) and radius 43.
; PLAN: r0=430(x), r1=198(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 198
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
