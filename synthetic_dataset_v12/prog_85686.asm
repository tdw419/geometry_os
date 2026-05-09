; DESCRIPTION: Places a purple line segment connecting (313, 181) to (395, 72).
; PLAN: r0=313(x1), r1=181(y1), r2=395(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 181
LDI r2, 395
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
