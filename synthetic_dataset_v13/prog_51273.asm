; DESCRIPTION: Places a yellow line segment connecting (300, 14) to (501, 217).
; PLAN: r0=300(x1), r1=14(y1), r2=501(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 14
LDI r2, 501
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
