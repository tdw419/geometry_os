; DESCRIPTION: Renders a white disk with center (259, 82) and radius 38.
; PLAN: r0=259(x), r1=82(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 82
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
