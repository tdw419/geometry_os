; DESCRIPTION: Renders a magenta disk with center (376, 120) and radius 40.
; PLAN: r0=376(x), r1=120(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 120
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
