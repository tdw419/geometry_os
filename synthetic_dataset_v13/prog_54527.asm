; DESCRIPTION: Places a purple line segment connecting (330, 56) to (388, 75).
; PLAN: r0=330(x1), r1=56(y1), r2=388(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 56
LDI r2, 388
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
