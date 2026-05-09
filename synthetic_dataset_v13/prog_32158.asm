; DESCRIPTION: Draws a yellow line from (150, 193) to (34, 97).
; PLAN: r0=150(x1), r1=193(y1), r2=34(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 193
LDI r2, 34
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
