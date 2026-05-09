; DESCRIPTION: Renders a red line between points (169, 145) and (190, 203).
; PLAN: r0=169(x1), r1=145(y1), r2=190(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 145
LDI r2, 190
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
