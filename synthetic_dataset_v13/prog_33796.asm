; DESCRIPTION: Draws a red line from (312, 29) to (421, 97).
; PLAN: r0=312(x1), r1=29(y1), r2=421(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 29
LDI r2, 421
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
