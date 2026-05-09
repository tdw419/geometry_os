; DESCRIPTION: Renders a blue disk with center (164, 62) and radius 60.
; PLAN: r0=164(x), r1=62(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 62
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
