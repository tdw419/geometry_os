; DESCRIPTION: Renders a white disk with center (214, 125) and radius 33.
; PLAN: r0=214(x), r1=125(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 125
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
