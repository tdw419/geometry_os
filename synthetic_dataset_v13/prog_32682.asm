; DESCRIPTION: Renders a yellow line between points (316, 120) and (163, 203).
; PLAN: r0=316(x1), r1=120(y1), r2=163(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 120
LDI r2, 163
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
