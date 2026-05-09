; DESCRIPTION: Renders a blue disk with center (237, 111) and radius 38.
; PLAN: r0=237(x), r1=111(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 111
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
