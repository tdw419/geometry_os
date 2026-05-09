; DESCRIPTION: Renders a magenta disk with center (376, 180) and radius 34.
; PLAN: r0=376(x), r1=180(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 180
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
