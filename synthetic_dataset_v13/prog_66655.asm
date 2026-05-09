; DESCRIPTION: Places a green line segment connecting (93, 241) to (279, 97).
; PLAN: r0=93(x1), r1=241(y1), r2=279(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 241
LDI r2, 279
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
