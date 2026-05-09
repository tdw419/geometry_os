; DESCRIPTION: Draws a red line from (353, 92) to (339, 58).
; PLAN: r0=353(x1), r1=92(y1), r2=339(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 92
LDI r2, 339
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
