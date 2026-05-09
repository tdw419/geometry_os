; DESCRIPTION: Draws a red line from (424, 217) to (314, 170).
; PLAN: r0=424(x1), r1=217(y1), r2=314(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 217
LDI r2, 314
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
