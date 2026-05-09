; DESCRIPTION: Draws a orange line from (324, 231) to (323, 23).
; PLAN: r0=324(x1), r1=231(y1), r2=323(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 231
LDI r2, 323
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
