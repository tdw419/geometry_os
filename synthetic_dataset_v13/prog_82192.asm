; DESCRIPTION: Renders a blue disk with center (96, 145) and radius 69.
; PLAN: r0=96(x), r1=145(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 145
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
