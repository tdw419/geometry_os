; DESCRIPTION: Renders a magenta disk with center (100, 95) and radius 38.
; PLAN: r0=100(x), r1=95(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 95
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
