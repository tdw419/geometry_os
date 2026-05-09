; DESCRIPTION: Renders a white disk with center (369, 116) and radius 75.
; PLAN: r0=369(x), r1=116(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 116
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
