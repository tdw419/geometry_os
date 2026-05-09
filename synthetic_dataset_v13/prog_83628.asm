; DESCRIPTION: Renders a white disk with center (345, 117) and radius 78.
; PLAN: r0=345(x), r1=117(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 117
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
