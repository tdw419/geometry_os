; DESCRIPTION: Places a magenta line segment connecting (13, 251) to (34, 17).
; PLAN: r0=13(x1), r1=251(y1), r2=34(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 251
LDI r2, 34
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
