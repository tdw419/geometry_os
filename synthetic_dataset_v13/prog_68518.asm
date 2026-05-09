; DESCRIPTION: Renders a red line between points (316, 147) and (76, 243).
; PLAN: r0=316(x1), r1=147(y1), r2=76(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 147
LDI r2, 76
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
