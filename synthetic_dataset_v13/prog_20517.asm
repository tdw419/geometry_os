; DESCRIPTION: Renders a magenta disk with center (437, 92) and radius 63.
; PLAN: r0=437(x), r1=92(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 92
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
