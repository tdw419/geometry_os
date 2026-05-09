; DESCRIPTION: Renders a blue disk with center (170, 79) and radius 15.
; PLAN: r0=170(x), r1=79(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 79
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
