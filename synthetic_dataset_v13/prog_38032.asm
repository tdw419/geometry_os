; DESCRIPTION: Renders a white disk with center (178, 117) and radius 37.
; PLAN: r0=178(x), r1=117(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 117
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
