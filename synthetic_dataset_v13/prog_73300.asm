; DESCRIPTION: Places a purple line segment connecting (17, 44) to (481, 227).
; PLAN: r0=17(x1), r1=44(y1), r2=481(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 44
LDI r2, 481
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
