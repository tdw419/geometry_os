; DESCRIPTION: Renders a blue disk with center (236, 171) and radius 56.
; PLAN: r0=236(x), r1=171(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 171
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
