; DESCRIPTION: Draws a red line from (99, 85) to (41, 119).
; PLAN: r0=99(x1), r1=85(y1), r2=41(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 85
LDI r2, 41
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
