; DESCRIPTION: Draws a red line from (124, 137) to (25, 147).
; PLAN: r0=124(x1), r1=137(y1), r2=25(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 137
LDI r2, 25
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
