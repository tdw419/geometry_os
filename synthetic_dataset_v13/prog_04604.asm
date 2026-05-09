; DESCRIPTION: Places a blue line segment connecting (15, 218) to (466, 200).
; PLAN: r0=15(x1), r1=218(y1), r2=466(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 218
LDI r2, 466
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
