; DESCRIPTION: Renders a yellow line between points (34, 170) and (431, 97).
; PLAN: r0=34(x1), r1=170(y1), r2=431(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 170
LDI r2, 431
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
