; DESCRIPTION: Renders a yellow disk with center (84, 115) and radius 76.
; PLAN: r0=84(x), r1=115(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 115
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
