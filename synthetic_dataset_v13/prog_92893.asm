; DESCRIPTION: Renders a magenta disk with center (125, 102) and radius 48.
; PLAN: r0=125(x), r1=102(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 102
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
