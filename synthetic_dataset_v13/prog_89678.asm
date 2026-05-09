; DESCRIPTION: Places a purple line segment connecting (347, 238) to (37, 152).
; PLAN: r0=347(x1), r1=238(y1), r2=37(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 238
LDI r2, 37
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
