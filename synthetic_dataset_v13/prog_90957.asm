; DESCRIPTION: Places a yellow line segment connecting (258, 112) to (489, 15).
; PLAN: r0=258(x1), r1=112(y1), r2=489(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 112
LDI r2, 489
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
