; DESCRIPTION: Draws a red line from (169, 14) to (318, 18).
; PLAN: r0=169(x1), r1=14(y1), r2=318(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 14
LDI r2, 318
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
