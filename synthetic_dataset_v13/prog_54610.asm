; DESCRIPTION: Renders a blue disk with center (392, 232) and radius 15.
; PLAN: r0=392(x), r1=232(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 232
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
