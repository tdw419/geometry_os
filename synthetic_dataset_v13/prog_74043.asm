; DESCRIPTION: Renders a magenta disk with center (67, 179) and radius 18.
; PLAN: r0=67(x), r1=179(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 179
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
