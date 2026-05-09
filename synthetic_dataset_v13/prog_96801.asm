; DESCRIPTION: Places a blue line segment connecting (432, 84) to (420, 104).
; PLAN: r0=432(x1), r1=84(y1), r2=420(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 84
LDI r2, 420
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
