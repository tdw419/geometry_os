; DESCRIPTION: Renders a magenta disk with center (96, 114) and radius 65.
; PLAN: r0=96(x), r1=114(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 114
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
