; DESCRIPTION: Renders a blue disk with center (114, 171) and radius 11.
; PLAN: r0=114(x), r1=171(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 171
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
