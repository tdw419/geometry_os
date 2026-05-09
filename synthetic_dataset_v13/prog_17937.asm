; DESCRIPTION: Places a purple line segment connecting (17, 123) to (34, 50).
; PLAN: r0=17(x1), r1=123(y1), r2=34(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 123
LDI r2, 34
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
