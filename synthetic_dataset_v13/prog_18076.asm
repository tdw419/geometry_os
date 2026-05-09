; DESCRIPTION: Draws a blue line from (322, 104) to (23, 218).
; PLAN: r0=322(x1), r1=104(y1), r2=23(x2), r3=218(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 104
LDI r2, 23
LDI r3, 218
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
