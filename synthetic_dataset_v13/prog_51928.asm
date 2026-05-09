; DESCRIPTION: Places a blue line segment connecting (436, 104) to (489, 154).
; PLAN: r0=436(x1), r1=104(y1), r2=489(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 104
LDI r2, 489
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
