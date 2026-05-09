; DESCRIPTION: Draws a magenta line from (41, 118) to (314, 121).
; PLAN: r0=41(x1), r1=118(y1), r2=314(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 118
LDI r2, 314
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
