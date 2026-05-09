; DESCRIPTION: Renders a blue disk with center (131, 106) and radius 79.
; PLAN: r0=131(x), r1=106(y), r2=79(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 106
LDI r2, 79
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
