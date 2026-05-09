; DESCRIPTION: Draws a red line from (344, 36) to (192, 85).
; PLAN: r0=344(x1), r1=36(y1), r2=192(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 36
LDI r2, 192
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
