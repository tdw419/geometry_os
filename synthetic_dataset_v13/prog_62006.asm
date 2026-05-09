; DESCRIPTION: Places a purple line segment connecting (501, 168) to (431, 172).
; PLAN: r0=501(x1), r1=168(y1), r2=431(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 168
LDI r2, 431
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
