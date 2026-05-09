; DESCRIPTION: Renders a blue disk with center (403, 78) and radius 53.
; PLAN: r0=403(x), r1=78(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 78
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
