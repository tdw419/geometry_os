; DESCRIPTION: Renders a yellow disk with center (237, 84) and radius 76.
; PLAN: r0=237(x), r1=84(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 84
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
