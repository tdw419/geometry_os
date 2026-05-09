; DESCRIPTION: Renders a magenta disk with center (125, 28) and radius 26.
; PLAN: r0=125(x), r1=28(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 28
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
