; DESCRIPTION: Places a purple line segment connecting (48, 13) to (99, 147).
; PLAN: r0=48(x1), r1=13(y1), r2=99(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 13
LDI r2, 99
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
