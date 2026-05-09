; DESCRIPTION: Draws a yellow line from (344, 58) to (213, 100).
; PLAN: r0=344(x1), r1=58(y1), r2=213(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 58
LDI r2, 213
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
