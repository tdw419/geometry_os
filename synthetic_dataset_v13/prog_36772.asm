; DESCRIPTION: Renders a white disk with center (316, 231) and radius 23.
; PLAN: r0=316(x), r1=231(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 231
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
