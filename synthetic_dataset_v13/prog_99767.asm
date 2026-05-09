; DESCRIPTION: Draws a red line from (484, 183) to (170, 9).
; PLAN: r0=484(x1), r1=183(y1), r2=170(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 183
LDI r2, 170
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
