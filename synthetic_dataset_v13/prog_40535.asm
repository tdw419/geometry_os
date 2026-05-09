; DESCRIPTION: Places a blue line segment connecting (431, 108) to (388, 220).
; PLAN: r0=431(x1), r1=108(y1), r2=388(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 108
LDI r2, 388
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
