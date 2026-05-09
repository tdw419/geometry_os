; DESCRIPTION: Renders a magenta disk with center (144, 158) and radius 39.
; PLAN: r0=144(x), r1=158(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 158
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
