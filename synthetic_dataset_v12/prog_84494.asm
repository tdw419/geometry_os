; DESCRIPTION: Draws a red line from (5, 190) to (389, 78).
; PLAN: r0=5(x1), r1=190(y1), r2=389(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 190
LDI r2, 389
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
