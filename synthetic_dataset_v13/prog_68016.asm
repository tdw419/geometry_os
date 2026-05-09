; DESCRIPTION: Renders a blue disk with center (324, 171) and radius 66.
; PLAN: r0=324(x), r1=171(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 171
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
