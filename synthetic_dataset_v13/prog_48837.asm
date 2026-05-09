; DESCRIPTION: Renders a magenta disk with center (427, 73) and radius 35.
; PLAN: r0=427(x), r1=73(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 73
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
