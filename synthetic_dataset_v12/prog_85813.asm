; DESCRIPTION: Renders a black disk with center (300, 108) and radius 38.
; PLAN: r0=300(x), r1=108(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 108
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
