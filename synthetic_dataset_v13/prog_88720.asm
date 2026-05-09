; DESCRIPTION: Renders a blue disk with center (272, 89) and radius 64.
; PLAN: r0=272(x), r1=89(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 89
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
