; DESCRIPTION: Draws a red line from (132, 53) to (181, 41).
; PLAN: r0=132(x1), r1=53(y1), r2=181(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 53
LDI r2, 181
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
