; DESCRIPTION: Renders a red line between points (306, 169) and (203, 45).
; PLAN: r0=306(x1), r1=169(y1), r2=203(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 169
LDI r2, 203
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
