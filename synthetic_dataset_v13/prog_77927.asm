; DESCRIPTION: Places a purple line segment connecting (198, 188) to (269, 135).
; PLAN: r0=198(x1), r1=188(y1), r2=269(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 188
LDI r2, 269
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
