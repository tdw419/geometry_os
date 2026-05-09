; DESCRIPTION: Places a purple line segment connecting (328, 122) to (141, 175).
; PLAN: r0=328(x1), r1=122(y1), r2=141(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 122
LDI r2, 141
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
