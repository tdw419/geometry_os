; DESCRIPTION: Renders a blue disk with center (222, 113) and radius 18.
; PLAN: r0=222(x), r1=113(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 113
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
