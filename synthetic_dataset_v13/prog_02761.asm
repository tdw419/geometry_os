; DESCRIPTION: Places a purple line segment connecting (152, 38) to (301, 251).
; PLAN: r0=152(x1), r1=38(y1), r2=301(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 38
LDI r2, 301
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
