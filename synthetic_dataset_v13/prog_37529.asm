; DESCRIPTION: Renders a blue disk with center (256, 163) and radius 54.
; PLAN: r0=256(x), r1=163(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 163
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
