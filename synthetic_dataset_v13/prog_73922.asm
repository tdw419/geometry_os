; DESCRIPTION: Places a yellow line segment connecting (114, 120) to (427, 23).
; PLAN: r0=114(x1), r1=120(y1), r2=427(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 120
LDI r2, 427
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
