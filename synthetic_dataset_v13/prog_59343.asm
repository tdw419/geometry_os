; DESCRIPTION: Places a blue line segment connecting (105, 230) to (484, 104).
; PLAN: r0=105(x1), r1=230(y1), r2=484(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 230
LDI r2, 484
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
