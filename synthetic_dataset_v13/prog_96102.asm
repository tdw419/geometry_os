; DESCRIPTION: Draws a red line from (342, 138) to (314, 40).
; PLAN: r0=342(x1), r1=138(y1), r2=314(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 138
LDI r2, 314
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
