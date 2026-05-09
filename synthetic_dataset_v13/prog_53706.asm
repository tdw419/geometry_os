; DESCRIPTION: Places a purple line segment connecting (112, 40) to (370, 2).
; PLAN: r0=112(x1), r1=40(y1), r2=370(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 40
LDI r2, 370
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
