; DESCRIPTION: Renders a white disk with center (334, 57) and radius 13.
; PLAN: r0=334(x), r1=57(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 57
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
