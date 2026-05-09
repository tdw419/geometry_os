; DESCRIPTION: Places a purple line segment connecting (198, 84) to (104, 207).
; PLAN: r0=198(x1), r1=84(y1), r2=104(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 84
LDI r2, 104
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
