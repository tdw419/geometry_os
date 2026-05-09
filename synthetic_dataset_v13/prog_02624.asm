; DESCRIPTION: Renders a magenta disk with center (233, 92) and radius 57.
; PLAN: r0=233(x), r1=92(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 92
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
