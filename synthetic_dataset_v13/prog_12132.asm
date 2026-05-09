; DESCRIPTION: Renders a blue disk with center (144, 108) and radius 53.
; PLAN: r0=144(x), r1=108(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 108
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
