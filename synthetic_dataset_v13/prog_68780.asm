; DESCRIPTION: Renders a magenta disk with center (29, 119) and radius 22.
; PLAN: r0=29(x), r1=119(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 119
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
