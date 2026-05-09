; DESCRIPTION: Renders a magenta disk with center (427, 88) and radius 75.
; PLAN: r0=427(x), r1=88(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 88
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
