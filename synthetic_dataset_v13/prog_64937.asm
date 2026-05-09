; DESCRIPTION: Places a blue line segment connecting (335, 76) to (328, 77).
; PLAN: r0=335(x1), r1=76(y1), r2=328(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 76
LDI r2, 328
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
