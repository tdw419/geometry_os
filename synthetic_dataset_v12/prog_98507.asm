; DESCRIPTION: Renders a magenta disk with center (145, 87) and radius 58.
; PLAN: r0=145(x), r1=87(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 87
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
