; DESCRIPTION: Renders a white disk with center (79, 198) and radius 44.
; PLAN: r0=79(x), r1=198(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 198
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
