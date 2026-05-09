; DESCRIPTION: Renders a blue disk with center (367, 185) and radius 20.
; PLAN: r0=367(x), r1=185(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 185
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
