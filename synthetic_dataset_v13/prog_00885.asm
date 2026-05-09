; DESCRIPTION: Draws a orange line from (358, 4) to (323, 158).
; PLAN: r0=358(x1), r1=4(y1), r2=323(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 4
LDI r2, 323
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
