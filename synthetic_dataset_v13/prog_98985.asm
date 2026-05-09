; DESCRIPTION: Places a purple line segment connecting (508, 22) to (286, 70).
; PLAN: r0=508(x1), r1=22(y1), r2=286(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 22
LDI r2, 286
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
