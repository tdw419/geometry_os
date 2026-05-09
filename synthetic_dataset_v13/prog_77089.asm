; DESCRIPTION: Renders a magenta disk with center (170, 69) and radius 18.
; PLAN: r0=170(x), r1=69(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 69
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
