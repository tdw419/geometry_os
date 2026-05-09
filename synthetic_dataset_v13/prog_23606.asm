; DESCRIPTION: Renders a magenta disk with center (339, 176) and radius 54.
; PLAN: r0=339(x), r1=176(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 176
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
