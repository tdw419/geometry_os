; DESCRIPTION: Places a red line segment connecting (203, 169) to (109, 96).
; PLAN: r0=203(x1), r1=169(y1), r2=109(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 169
LDI r2, 109
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
