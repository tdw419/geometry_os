; DESCRIPTION: Renders a magenta disk with center (230, 88) and radius 72.
; PLAN: r0=230(x), r1=88(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 88
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
