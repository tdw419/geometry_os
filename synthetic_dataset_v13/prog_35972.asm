; DESCRIPTION: Places a purple line segment connecting (56, 33) to (96, 2).
; PLAN: r0=56(x1), r1=33(y1), r2=96(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 33
LDI r2, 96
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
