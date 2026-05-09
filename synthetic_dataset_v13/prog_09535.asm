; DESCRIPTION: Places a purple line segment connecting (245, 231) to (501, 32).
; PLAN: r0=245(x1), r1=231(y1), r2=501(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 231
LDI r2, 501
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
