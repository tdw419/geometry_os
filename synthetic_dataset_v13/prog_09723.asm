; DESCRIPTION: Renders a blue disk with center (163, 143) and radius 63.
; PLAN: r0=163(x), r1=143(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 143
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
