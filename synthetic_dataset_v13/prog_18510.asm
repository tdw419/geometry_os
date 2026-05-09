; DESCRIPTION: Renders a white line between points (241, 54) and (407, 53).
; PLAN: r0=241(x1), r1=54(y1), r2=407(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 54
LDI r2, 407
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
