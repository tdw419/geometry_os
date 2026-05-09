; DESCRIPTION: Renders a white disk with center (312, 97) and radius 64.
; PLAN: r0=312(x), r1=97(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 97
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
