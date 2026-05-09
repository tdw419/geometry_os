; DESCRIPTION: Renders a blue disk with center (359, 117) and radius 45.
; PLAN: r0=359(x), r1=117(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 117
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
