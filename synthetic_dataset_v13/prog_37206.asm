; DESCRIPTION: Renders a magenta disk with center (303, 96) and radius 62.
; PLAN: r0=303(x), r1=96(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 96
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
