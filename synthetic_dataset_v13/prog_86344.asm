; DESCRIPTION: Renders a magenta disk with center (413, 139) and radius 46.
; PLAN: r0=413(x), r1=139(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 139
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
