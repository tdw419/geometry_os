; DESCRIPTION: Draws a red line from (432, 229) to (308, 185).
; PLAN: r0=432(x1), r1=229(y1), r2=308(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 229
LDI r2, 308
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
