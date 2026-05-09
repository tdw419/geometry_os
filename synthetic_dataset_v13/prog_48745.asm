; DESCRIPTION: Renders a black disk with center (353, 131) and radius 21.
; PLAN: r0=353(x), r1=131(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 131
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
