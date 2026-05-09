; DESCRIPTION: Places a purple line segment connecting (501, 200) to (506, 43).
; PLAN: r0=501(x1), r1=200(y1), r2=506(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 200
LDI r2, 506
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
