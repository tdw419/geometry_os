; DESCRIPTION: Renders a white disk with center (283, 90) and radius 75.
; PLAN: r0=283(x), r1=90(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 90
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
