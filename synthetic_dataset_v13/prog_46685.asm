; DESCRIPTION: Places a purple line segment connecting (370, 40) to (493, 52).
; PLAN: r0=370(x1), r1=40(y1), r2=493(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 40
LDI r2, 493
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
