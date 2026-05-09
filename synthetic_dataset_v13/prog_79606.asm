; DESCRIPTION: Renders a white disk with center (275, 96) and radius 74.
; PLAN: r0=275(x), r1=96(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 96
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
