; DESCRIPTION: Draws a yellow line from (125, 247) to (133, 41).
; PLAN: r0=125(x1), r1=247(y1), r2=133(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 247
LDI r2, 133
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
