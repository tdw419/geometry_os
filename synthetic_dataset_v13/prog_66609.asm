; DESCRIPTION: Draws a red line from (190, 198) to (192, 200).
; PLAN: r0=190(x1), r1=198(y1), r2=192(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 198
LDI r2, 192
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
