; DESCRIPTION: Places a purple line segment connecting (258, 157) to (392, 31).
; PLAN: r0=258(x1), r1=157(y1), r2=392(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 157
LDI r2, 392
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
