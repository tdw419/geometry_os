; DESCRIPTION: Draws a red line from (353, 81) to (80, 41).
; PLAN: r0=353(x1), r1=81(y1), r2=80(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 81
LDI r2, 80
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
