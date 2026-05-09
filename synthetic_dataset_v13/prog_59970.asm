; DESCRIPTION: Places a blue line segment connecting (495, 255) to (335, 23).
; PLAN: r0=495(x1), r1=255(y1), r2=335(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 255
LDI r2, 335
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
