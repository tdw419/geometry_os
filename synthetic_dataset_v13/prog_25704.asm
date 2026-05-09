; DESCRIPTION: Draws a red line from (133, 190) to (342, 231).
; PLAN: r0=133(x1), r1=190(y1), r2=342(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 190
LDI r2, 342
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
