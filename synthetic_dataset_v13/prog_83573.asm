; DESCRIPTION: Places a blue line segment connecting (4, 185) to (469, 80).
; PLAN: r0=4(x1), r1=185(y1), r2=469(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 185
LDI r2, 469
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
