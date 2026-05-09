; DESCRIPTION: Renders a blue disk with center (335, 123) and radius 64.
; PLAN: r0=335(x), r1=123(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 123
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
