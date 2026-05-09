; DESCRIPTION: Places a purple line segment connecting (56, 58) to (198, 244).
; PLAN: r0=56(x1), r1=58(y1), r2=198(x2), r3=244(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 58
LDI r2, 198
LDI r3, 244
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
