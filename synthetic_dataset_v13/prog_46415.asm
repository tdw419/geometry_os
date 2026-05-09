; DESCRIPTION: Places a purple line segment connecting (431, 59) to (347, 100).
; PLAN: r0=431(x1), r1=59(y1), r2=347(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 59
LDI r2, 347
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
