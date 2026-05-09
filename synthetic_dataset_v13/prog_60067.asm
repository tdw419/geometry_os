; DESCRIPTION: Draws a red line from (198, 26) to (323, 205).
; PLAN: r0=198(x1), r1=26(y1), r2=323(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 26
LDI r2, 323
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
