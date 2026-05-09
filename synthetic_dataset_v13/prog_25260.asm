; DESCRIPTION: Places a orange line segment connecting (362, 181) to (314, 238).
; PLAN: r0=362(x1), r1=181(y1), r2=314(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 181
LDI r2, 314
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
