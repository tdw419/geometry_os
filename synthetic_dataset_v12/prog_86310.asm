; DESCRIPTION: Renders a magenta disk with center (81, 176) and radius 74.
; PLAN: r0=81(x), r1=176(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 176
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
