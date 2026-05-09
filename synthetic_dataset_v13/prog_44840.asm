; DESCRIPTION: Places a blue line segment connecting (484, 133) to (96, 132).
; PLAN: r0=484(x1), r1=133(y1), r2=96(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 133
LDI r2, 96
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
