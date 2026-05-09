; DESCRIPTION: Draws a red line from (261, 227) to (105, 10).
; PLAN: r0=261(x1), r1=227(y1), r2=105(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 227
LDI r2, 105
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
