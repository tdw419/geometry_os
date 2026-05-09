; DESCRIPTION: Renders a magenta disk with center (379, 125) and radius 77.
; PLAN: r0=379(x), r1=125(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 125
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
