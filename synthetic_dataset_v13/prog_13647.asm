; DESCRIPTION: Draws a red line from (251, 147) to (163, 229).
; PLAN: r0=251(x1), r1=147(y1), r2=163(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 147
LDI r2, 163
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
