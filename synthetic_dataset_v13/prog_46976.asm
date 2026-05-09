; DESCRIPTION: Draws a yellow line from (23, 1) to (314, 97).
; PLAN: r0=23(x1), r1=1(y1), r2=314(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 1
LDI r2, 314
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
