; DESCRIPTION: Renders a blue disk with center (200, 162) and radius 79.
; PLAN: r0=200(x), r1=162(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 162
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
