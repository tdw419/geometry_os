; DESCRIPTION: Renders a blue disk with center (350, 134) and radius 69.
; PLAN: r0=350(x), r1=134(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 134
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
