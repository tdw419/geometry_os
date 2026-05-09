; DESCRIPTION: Renders a magenta disk with center (396, 96) and radius 15.
; PLAN: r0=396(x), r1=96(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 96
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
