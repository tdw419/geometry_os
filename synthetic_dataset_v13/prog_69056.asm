; DESCRIPTION: Places a blue line segment connecting (84, 230) to (376, 179).
; PLAN: r0=84(x1), r1=230(y1), r2=376(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 230
LDI r2, 376
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
