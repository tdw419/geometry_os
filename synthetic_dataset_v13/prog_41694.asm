; DESCRIPTION: Renders a blue disk with center (34, 108) and radius 22.
; PLAN: r0=34(x), r1=108(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 108
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
