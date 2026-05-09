; DESCRIPTION: Renders a white disk with center (221, 79) and radius 50.
; PLAN: r0=221(x), r1=79(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 79
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
