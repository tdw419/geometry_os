; DESCRIPTION: Renders a white line between points (10, 232) and (261, 53).
; PLAN: r0=10(x1), r1=232(y1), r2=261(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 232
LDI r2, 261
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
