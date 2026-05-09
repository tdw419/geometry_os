; DESCRIPTION: Renders a magenta disk with center (97, 80) and radius 59.
; PLAN: r0=97(x), r1=80(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 80
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
