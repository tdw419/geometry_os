; DESCRIPTION: Renders a blue disk with center (272, 84) and radius 69.
; PLAN: r0=272(x), r1=84(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 84
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
