; DESCRIPTION: Renders a white disk with center (407, 125) and radius 50.
; PLAN: r0=407(x), r1=125(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 125
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
