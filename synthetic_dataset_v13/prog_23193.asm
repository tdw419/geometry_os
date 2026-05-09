; DESCRIPTION: Places a purple line segment connecting (351, 84) to (482, 198).
; PLAN: r0=351(x1), r1=84(y1), r2=482(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 84
LDI r2, 482
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
