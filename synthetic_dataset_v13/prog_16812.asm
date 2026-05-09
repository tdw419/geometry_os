; DESCRIPTION: Renders a white disk with center (362, 134) and radius 74.
; PLAN: r0=362(x), r1=134(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 134
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
