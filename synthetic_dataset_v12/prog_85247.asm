; DESCRIPTION: Places a blue line segment connecting (278, 71) to (468, 155).
; PLAN: r0=278(x1), r1=71(y1), r2=468(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 71
LDI r2, 468
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
