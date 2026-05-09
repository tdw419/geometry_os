; DESCRIPTION: Renders a white disk with center (454, 198) and radius 19.
; PLAN: r0=454(x), r1=198(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 198
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
