; DESCRIPTION: Renders a white disk with center (61, 73) and radius 56.
; PLAN: r0=61(x), r1=73(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 73
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
