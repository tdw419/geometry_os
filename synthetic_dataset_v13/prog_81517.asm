; DESCRIPTION: Renders a magenta disk with center (227, 84) and radius 35.
; PLAN: r0=227(x), r1=84(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 84
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
