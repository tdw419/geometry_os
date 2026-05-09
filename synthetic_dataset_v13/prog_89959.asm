; DESCRIPTION: Places a yellow line segment connecting (427, 168) to (57, 58).
; PLAN: r0=427(x1), r1=168(y1), r2=57(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 168
LDI r2, 57
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
