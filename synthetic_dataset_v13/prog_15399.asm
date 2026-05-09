; DESCRIPTION: Draws a red line from (265, 109) to (314, 178).
; PLAN: r0=265(x1), r1=109(y1), r2=314(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 109
LDI r2, 314
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
