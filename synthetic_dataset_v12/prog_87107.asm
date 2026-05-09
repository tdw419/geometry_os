; DESCRIPTION: Places a purple line segment connecting (110, 21) to (353, 168).
; PLAN: r0=110(x1), r1=21(y1), r2=353(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 21
LDI r2, 353
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
