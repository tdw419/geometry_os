; DESCRIPTION: Places a purple line segment connecting (45, 34) to (447, 59).
; PLAN: r0=45(x1), r1=34(y1), r2=447(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 34
LDI r2, 447
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
