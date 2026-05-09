; DESCRIPTION: Places a blue line segment connecting (43, 211) to (489, 162).
; PLAN: r0=43(x1), r1=211(y1), r2=489(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 211
LDI r2, 489
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
