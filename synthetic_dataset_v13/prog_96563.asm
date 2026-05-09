; DESCRIPTION: Draws a yellow line from (41, 238) to (106, 60).
; PLAN: r0=41(x1), r1=238(y1), r2=106(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 238
LDI r2, 106
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
