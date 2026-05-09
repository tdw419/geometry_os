; DESCRIPTION: Renders a blue disk with center (116, 156) and radius 67.
; PLAN: r0=116(x), r1=156(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 156
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
