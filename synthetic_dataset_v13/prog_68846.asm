; DESCRIPTION: Renders a magenta disk with center (261, 106) and radius 11.
; PLAN: r0=261(x), r1=106(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 106
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
