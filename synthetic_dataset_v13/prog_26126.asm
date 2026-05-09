; DESCRIPTION: Renders a white disk with center (120, 79) and radius 58.
; PLAN: r0=120(x), r1=79(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 79
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
