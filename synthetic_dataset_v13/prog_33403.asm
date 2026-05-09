; DESCRIPTION: Draws a yellow line from (314, 131) to (344, 52).
; PLAN: r0=314(x1), r1=131(y1), r2=344(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 131
LDI r2, 344
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
