; DESCRIPTION: Renders a blue disk with center (377, 141) and radius 28.
; PLAN: r0=377(x), r1=141(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 141
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
