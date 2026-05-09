; DESCRIPTION: Renders a white disk with center (233, 53) and radius 19.
; PLAN: r0=233(x), r1=53(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 53
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
