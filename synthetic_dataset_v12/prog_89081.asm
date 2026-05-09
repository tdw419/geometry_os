; DESCRIPTION: Renders a white line between points (316, 203) and (6, 223).
; PLAN: r0=316(x1), r1=203(y1), r2=6(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 203
LDI r2, 6
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
