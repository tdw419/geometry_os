; DESCRIPTION: Renders a magenta disk with center (376, 134) and radius 49.
; PLAN: r0=376(x), r1=134(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 134
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
