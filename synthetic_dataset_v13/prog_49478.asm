; DESCRIPTION: Renders a blue disk with center (79, 212) and radius 44.
; PLAN: r0=79(x), r1=212(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 212
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
