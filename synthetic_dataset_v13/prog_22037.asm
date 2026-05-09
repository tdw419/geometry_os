; DESCRIPTION: Renders a magenta disk with center (156, 156) and radius 67.
; PLAN: r0=156(x), r1=156(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 156
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
