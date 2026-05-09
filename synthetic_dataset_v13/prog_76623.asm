; DESCRIPTION: Renders a magenta disk with center (332, 155) and radius 39.
; PLAN: r0=332(x), r1=155(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 155
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
