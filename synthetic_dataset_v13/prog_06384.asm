; DESCRIPTION: Places a blue line segment connecting (314, 34) to (34, 173).
; PLAN: r0=314(x1), r1=34(y1), r2=34(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 34
LDI r2, 34
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
