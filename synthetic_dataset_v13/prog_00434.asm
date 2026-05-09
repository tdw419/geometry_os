; DESCRIPTION: Renders a magenta disk with center (101, 92) and radius 49.
; PLAN: r0=101(x), r1=92(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 92
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
