; DESCRIPTION: Renders a blue disk with center (350, 141) and radius 47.
; PLAN: r0=350(x), r1=141(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 141
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
