; DESCRIPTION: Renders a magenta disk with center (279, 109) and radius 34.
; PLAN: r0=279(x), r1=109(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 109
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
