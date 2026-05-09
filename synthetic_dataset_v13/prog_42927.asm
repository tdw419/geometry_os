; DESCRIPTION: Renders a white line between points (9, 203) and (369, 66).
; PLAN: r0=9(x1), r1=203(y1), r2=369(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 203
LDI r2, 369
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
