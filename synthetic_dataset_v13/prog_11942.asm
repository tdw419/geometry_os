; DESCRIPTION: Draws a red line from (52, 252) to (428, 153).
; PLAN: r0=52(x1), r1=252(y1), r2=428(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 252
LDI r2, 428
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
