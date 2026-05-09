; DESCRIPTION: Renders a yellow disk with center (385, 76) and radius 22.
; PLAN: r0=385(x), r1=76(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 76
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
