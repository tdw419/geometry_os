; DESCRIPTION: Renders a blue disk with center (248, 98) and radius 63.
; PLAN: r0=248(x), r1=98(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 98
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
