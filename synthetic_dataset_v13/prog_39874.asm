; DESCRIPTION: Places a blue line segment connecting (72, 181) to (8, 118).
; PLAN: r0=72(x1), r1=181(y1), r2=8(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 181
LDI r2, 8
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
