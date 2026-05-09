; DESCRIPTION: Places a purple line segment connecting (223, 108) to (233, 13).
; PLAN: r0=223(x1), r1=108(y1), r2=233(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 108
LDI r2, 233
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
