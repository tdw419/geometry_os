; DESCRIPTION: Renders a white disk with center (469, 143) and radius 34.
; PLAN: r0=469(x), r1=143(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 143
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
