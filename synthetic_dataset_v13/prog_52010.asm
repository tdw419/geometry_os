; DESCRIPTION: Renders a blue disk with center (406, 125) and radius 51.
; PLAN: r0=406(x), r1=125(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 125
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
