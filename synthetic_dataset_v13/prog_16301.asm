; DESCRIPTION: Renders a white disk with center (98, 84) and radius 51.
; PLAN: r0=98(x), r1=84(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 84
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
