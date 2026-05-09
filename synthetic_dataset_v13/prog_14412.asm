; DESCRIPTION: Renders a white disk with center (184, 204) and radius 29.
; PLAN: r0=184(x), r1=204(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 204
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
