; DESCRIPTION: Renders a magenta disk with center (69, 185) and radius 30.
; PLAN: r0=69(x), r1=185(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 185
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
