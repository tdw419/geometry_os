; DESCRIPTION: Places a yellow line segment connecting (452, 139) to (226, 97).
; PLAN: r0=452(x1), r1=139(y1), r2=226(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 139
LDI r2, 226
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
