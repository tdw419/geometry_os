; DESCRIPTION: Renders a magenta disk with center (102, 109) and radius 34.
; PLAN: r0=102(x), r1=109(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 109
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
