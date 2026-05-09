; DESCRIPTION: Renders a white disk with center (161, 142) and radius 62.
; PLAN: r0=161(x), r1=142(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 142
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
