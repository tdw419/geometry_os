; DESCRIPTION: Renders a magenta disk with center (413, 184) and radius 43.
; PLAN: r0=413(x), r1=184(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 184
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
