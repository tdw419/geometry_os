; DESCRIPTION: Renders a magenta disk with center (338, 148) and radius 49.
; PLAN: r0=338(x), r1=148(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 148
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
