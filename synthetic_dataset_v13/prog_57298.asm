; DESCRIPTION: Draws a yellow line from (133, 94) to (119, 41).
; PLAN: r0=133(x1), r1=94(y1), r2=119(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 94
LDI r2, 119
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
