; DESCRIPTION: Renders a blue disk with center (358, 125) and radius 25.
; PLAN: r0=358(x), r1=125(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 125
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
