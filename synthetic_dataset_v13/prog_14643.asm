; DESCRIPTION: Places a blue line segment connecting (427, 238) to (392, 25).
; PLAN: r0=427(x1), r1=238(y1), r2=392(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 238
LDI r2, 392
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
