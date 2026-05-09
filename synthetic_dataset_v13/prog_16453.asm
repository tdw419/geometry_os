; DESCRIPTION: Renders a magenta disk with center (339, 97) and radius 76.
; PLAN: r0=339(x), r1=97(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 97
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
