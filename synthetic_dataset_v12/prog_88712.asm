; DESCRIPTION: Places a blue line segment connecting (337, 161) to (484, 36).
; PLAN: r0=337(x1), r1=161(y1), r2=484(x2), r3=36(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 161
LDI r2, 484
LDI r3, 36
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
