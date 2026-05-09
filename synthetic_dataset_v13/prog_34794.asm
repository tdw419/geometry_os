; DESCRIPTION: Draws a yellow line from (2, 112) to (41, 202).
; PLAN: r0=2(x1), r1=112(y1), r2=41(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 112
LDI r2, 41
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
