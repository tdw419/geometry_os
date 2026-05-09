; DESCRIPTION: Draws a yellow line from (51, 218) to (259, 41).
; PLAN: r0=51(x1), r1=218(y1), r2=259(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 218
LDI r2, 259
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
