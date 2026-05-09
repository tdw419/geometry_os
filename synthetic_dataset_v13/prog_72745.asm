; DESCRIPTION: Draws a red line from (250, 169) to (85, 80).
; PLAN: r0=250(x1), r1=169(y1), r2=85(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 169
LDI r2, 85
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
