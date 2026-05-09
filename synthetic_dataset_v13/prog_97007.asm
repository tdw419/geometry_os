; DESCRIPTION: Renders a magenta disk with center (246, 155) and radius 67.
; PLAN: r0=246(x), r1=155(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 155
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
