; DESCRIPTION: Renders a magenta disk with center (348, 81) and radius 50.
; PLAN: r0=348(x), r1=81(y), r2=50(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 81
LDI r2, 50
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
