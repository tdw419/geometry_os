; DESCRIPTION: Places a white line segment connecting (332, 49) to (489, 119).
; PLAN: r0=332(x1), r1=49(y1), r2=489(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 49
LDI r2, 489
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
