; DESCRIPTION: Draws a red line from (169, 137) to (343, 227).
; PLAN: r0=169(x1), r1=137(y1), r2=343(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 137
LDI r2, 343
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
