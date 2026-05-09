; DESCRIPTION: Renders a black disk with center (62, 148) and radius 59.
; PLAN: r0=62(x), r1=148(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 148
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
