; DESCRIPTION: Renders a blue disk with center (395, 174) and radius 49.
; PLAN: r0=395(x), r1=174(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 174
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
