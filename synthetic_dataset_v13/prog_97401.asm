; DESCRIPTION: Draws a red line from (344, 0) to (137, 216).
; PLAN: r0=344(x1), r1=0(y1), r2=137(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 0
LDI r2, 137
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
