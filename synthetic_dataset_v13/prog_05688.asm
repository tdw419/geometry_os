; DESCRIPTION: Places a blue line segment connecting (72, 112) to (335, 47).
; PLAN: r0=72(x1), r1=112(y1), r2=335(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 112
LDI r2, 335
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
