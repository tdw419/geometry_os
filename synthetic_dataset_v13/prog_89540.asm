; DESCRIPTION: Draws a red line from (41, 90) to (330, 34).
; PLAN: r0=41(x1), r1=90(y1), r2=330(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 90
LDI r2, 330
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
