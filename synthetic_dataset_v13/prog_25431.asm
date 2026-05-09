; DESCRIPTION: Draws a orange line from (484, 73) to (137, 47).
; PLAN: r0=484(x1), r1=73(y1), r2=137(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 73
LDI r2, 137
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
