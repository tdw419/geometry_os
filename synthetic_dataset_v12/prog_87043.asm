; DESCRIPTION: Renders a white disk with center (80, 61) and radius 28.
; PLAN: r0=80(x), r1=61(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 61
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
