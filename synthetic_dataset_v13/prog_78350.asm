; DESCRIPTION: Renders a white disk with center (430, 161) and radius 24.
; PLAN: r0=430(x), r1=161(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 161
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
