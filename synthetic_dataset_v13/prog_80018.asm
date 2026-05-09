; DESCRIPTION: Places a purple line segment connecting (56, 231) to (83, 10).
; PLAN: r0=56(x1), r1=231(y1), r2=83(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 231
LDI r2, 83
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
