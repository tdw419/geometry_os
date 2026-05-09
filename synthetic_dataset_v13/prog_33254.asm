; DESCRIPTION: Renders a white disk with center (134, 121) and radius 29.
; PLAN: r0=134(x), r1=121(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 121
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
