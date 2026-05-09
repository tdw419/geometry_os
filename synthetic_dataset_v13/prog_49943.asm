; DESCRIPTION: Renders a green disk with center (385, 62) and radius 23.
; PLAN: r0=385(x), r1=62(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 62
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
