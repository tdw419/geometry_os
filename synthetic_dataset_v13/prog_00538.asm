; DESCRIPTION: Renders a blue disk with center (363, 84) and radius 32.
; PLAN: r0=363(x), r1=84(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 84
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
