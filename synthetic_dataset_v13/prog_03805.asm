; DESCRIPTION: Places a purple line segment connecting (337, 133) to (492, 206).
; PLAN: r0=337(x1), r1=133(y1), r2=492(x2), r3=206(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 133
LDI r2, 492
LDI r3, 206
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
