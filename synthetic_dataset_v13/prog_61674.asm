; DESCRIPTION: Renders a magenta disk with center (304, 155) and radius 20.
; PLAN: r0=304(x), r1=155(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 155
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
