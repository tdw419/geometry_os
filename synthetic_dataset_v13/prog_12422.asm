; DESCRIPTION: Renders a magenta disk with center (56, 156) and radius 29.
; PLAN: r0=56(x), r1=156(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 156
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
