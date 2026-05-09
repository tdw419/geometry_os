; DESCRIPTION: Renders a white disk with center (379, 34) and radius 19.
; PLAN: r0=379(x), r1=34(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 34
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
