; DESCRIPTION: Draws a red line from (323, 227) to (117, 127).
; PLAN: r0=323(x1), r1=227(y1), r2=117(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 227
LDI r2, 117
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
