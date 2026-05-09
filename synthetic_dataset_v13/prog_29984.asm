; DESCRIPTION: Renders a magenta disk with center (319, 122) and radius 69.
; PLAN: r0=319(x), r1=122(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 122
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
