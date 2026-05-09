; DESCRIPTION: Renders a magenta disk with center (282, 131) and radius 72.
; PLAN: r0=282(x), r1=131(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 131
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
