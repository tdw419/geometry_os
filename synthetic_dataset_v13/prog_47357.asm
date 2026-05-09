; DESCRIPTION: Renders a magenta disk with center (145, 203) and radius 33.
; PLAN: r0=145(x), r1=203(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 203
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
