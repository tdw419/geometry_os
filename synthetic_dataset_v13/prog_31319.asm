; DESCRIPTION: Draws a green line from (36, 34) to (232, 252).
; PLAN: r0=36(x1), r1=34(y1), r2=232(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 34
LDI r2, 232
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
