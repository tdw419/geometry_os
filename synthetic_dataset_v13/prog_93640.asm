; DESCRIPTION: Draws a orange line from (212, 120) to (221, 41).
; PLAN: r0=212(x1), r1=120(y1), r2=221(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 120
LDI r2, 221
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
