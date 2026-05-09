; DESCRIPTION: Renders a white disk with center (275, 175) and radius 47.
; PLAN: r0=275(x), r1=175(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 175
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
