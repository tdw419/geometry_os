; DESCRIPTION: Renders a white disk with center (85, 75) and radius 69.
; PLAN: r0=85(x), r1=75(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 75
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
