; DESCRIPTION: Renders a magenta disk with center (204, 140) and radius 65.
; PLAN: r0=204(x), r1=140(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 140
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
