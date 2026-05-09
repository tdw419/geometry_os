; DESCRIPTION: Draws a red line from (318, 137) to (441, 35).
; PLAN: r0=318(x1), r1=137(y1), r2=441(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 137
LDI r2, 441
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
