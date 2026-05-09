; DESCRIPTION: Places a yellow line segment connecting (385, 72) to (145, 97).
; PLAN: r0=385(x1), r1=72(y1), r2=145(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 72
LDI r2, 145
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
