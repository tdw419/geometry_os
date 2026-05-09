; DESCRIPTION: Renders a magenta disk with center (267, 183) and radius 26.
; PLAN: r0=267(x), r1=183(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 183
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
