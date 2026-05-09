; DESCRIPTION: Renders a white disk with center (133, 114) and radius 58.
; PLAN: r0=133(x), r1=114(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 114
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
