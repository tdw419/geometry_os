; DESCRIPTION: Renders a blue disk with center (384, 86) and radius 25.
; PLAN: r0=384(x), r1=86(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 86
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
