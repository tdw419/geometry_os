; DESCRIPTION: Renders a blue disk with center (133, 141) and radius 11.
; PLAN: r0=133(x), r1=141(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 141
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
