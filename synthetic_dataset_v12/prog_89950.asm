; DESCRIPTION: Draws a yellow line from (140, 101) to (344, 47).
; PLAN: r0=140(x1), r1=101(y1), r2=344(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 101
LDI r2, 344
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
