; DESCRIPTION: Draws a yellow line from (13, 101) to (305, 97).
; PLAN: r0=13(x1), r1=101(y1), r2=305(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 101
LDI r2, 305
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
