; DESCRIPTION: Renders a white disk with center (145, 84) and radius 70.
; PLAN: r0=145(x), r1=84(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 84
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
