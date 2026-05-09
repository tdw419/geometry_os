; DESCRIPTION: Renders a white disk with center (223, 67) and radius 38.
; PLAN: r0=223(x), r1=67(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 67
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
