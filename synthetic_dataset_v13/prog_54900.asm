; DESCRIPTION: Renders a magenta disk with center (103, 156) and radius 43.
; PLAN: r0=103(x), r1=156(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 156
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
