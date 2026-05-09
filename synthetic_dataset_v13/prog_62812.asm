; DESCRIPTION: Renders a white disk with center (158, 125) and radius 43.
; PLAN: r0=158(x), r1=125(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 125
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
