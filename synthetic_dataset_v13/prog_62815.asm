; DESCRIPTION: Places a purple line segment connecting (198, 110) to (15, 31).
; PLAN: r0=198(x1), r1=110(y1), r2=15(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 110
LDI r2, 15
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
