; DESCRIPTION: Places a purple line segment connecting (489, 184) to (261, 115).
; PLAN: r0=489(x1), r1=184(y1), r2=261(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 184
LDI r2, 261
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
