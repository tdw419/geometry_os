; DESCRIPTION: Draws a orange line from (252, 120) to (323, 1).
; PLAN: r0=252(x1), r1=120(y1), r2=323(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 120
LDI r2, 323
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
