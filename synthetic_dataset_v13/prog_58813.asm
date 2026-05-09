; DESCRIPTION: Places a purple line segment connecting (198, 99) to (412, 152).
; PLAN: r0=198(x1), r1=99(y1), r2=412(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 99
LDI r2, 412
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
