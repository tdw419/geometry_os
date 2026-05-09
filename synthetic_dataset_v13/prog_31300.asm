; DESCRIPTION: Places a purple line segment connecting (347, 59) to (98, 138).
; PLAN: r0=347(x1), r1=59(y1), r2=98(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 59
LDI r2, 98
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
