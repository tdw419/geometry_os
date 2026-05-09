; DESCRIPTION: Renders a magenta disk with center (62, 166) and radius 62.
; PLAN: r0=62(x), r1=166(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 166
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
