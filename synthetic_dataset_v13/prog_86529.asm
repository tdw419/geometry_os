; DESCRIPTION: Renders a blue disk with center (384, 68) and radius 59.
; PLAN: r0=384(x), r1=68(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 68
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
