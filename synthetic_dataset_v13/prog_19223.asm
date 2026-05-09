; DESCRIPTION: Renders a magenta disk with center (125, 112) and radius 62.
; PLAN: r0=125(x), r1=112(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 112
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
