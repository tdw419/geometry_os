; DESCRIPTION: Places a blue line segment connecting (431, 245) to (185, 34).
; PLAN: r0=431(x1), r1=245(y1), r2=185(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 245
LDI r2, 185
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
