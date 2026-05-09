; DESCRIPTION: Renders a magenta disk with center (185, 112) and radius 72.
; PLAN: r0=185(x), r1=112(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 112
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
