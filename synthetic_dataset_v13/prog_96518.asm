; DESCRIPTION: Renders a blue disk with center (376, 38) and radius 19.
; PLAN: r0=376(x), r1=38(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 38
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
