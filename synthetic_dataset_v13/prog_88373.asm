; DESCRIPTION: Renders a magenta disk with center (424, 88) and radius 54.
; PLAN: r0=424(x), r1=88(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 88
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
