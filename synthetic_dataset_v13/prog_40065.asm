; DESCRIPTION: Places a purple line segment connecting (451, 236) to (76, 152).
; PLAN: r0=451(x1), r1=236(y1), r2=76(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 236
LDI r2, 76
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
