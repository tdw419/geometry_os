; DESCRIPTION: Renders a magenta disk with center (40, 76) and radius 30.
; PLAN: r0=40(x), r1=76(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 76
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
