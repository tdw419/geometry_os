; DESCRIPTION: Draws a red line from (312, 145) to (266, 47).
; PLAN: r0=312(x1), r1=145(y1), r2=266(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 145
LDI r2, 266
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
