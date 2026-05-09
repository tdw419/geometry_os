; DESCRIPTION: Renders a magenta disk with center (434, 131) and radius 77.
; PLAN: r0=434(x), r1=131(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 131
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
