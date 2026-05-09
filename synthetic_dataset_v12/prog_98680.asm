; DESCRIPTION: Renders a white disk with center (223, 60) and radius 56.
; PLAN: r0=223(x), r1=60(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 60
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
