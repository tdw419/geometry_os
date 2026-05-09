; DESCRIPTION: Places a yellow line segment connecting (155, 132) to (301, 251).
; PLAN: r0=155(x1), r1=132(y1), r2=301(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 132
LDI r2, 301
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
