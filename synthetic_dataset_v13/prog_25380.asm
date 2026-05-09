; DESCRIPTION: Places a blue line segment connecting (18, 153) to (301, 49).
; PLAN: r0=18(x1), r1=153(y1), r2=301(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 153
LDI r2, 301
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
