; DESCRIPTION: Draws a yellow line from (339, 38) to (179, 188).
; PLAN: r0=339(x1), r1=38(y1), r2=179(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 38
LDI r2, 179
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
