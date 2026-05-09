; DESCRIPTION: Places a blue line segment connecting (339, 61) to (308, 47).
; PLAN: r0=339(x1), r1=61(y1), r2=308(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 61
LDI r2, 308
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
