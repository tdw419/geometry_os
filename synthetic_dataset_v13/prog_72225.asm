; DESCRIPTION: Places a purple line segment connecting (222, 255) to (501, 108).
; PLAN: r0=222(x1), r1=255(y1), r2=501(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 255
LDI r2, 501
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
