; DESCRIPTION: Places a purple line segment connecting (231, 7) to (153, 69).
; PLAN: r0=231(x1), r1=7(y1), r2=153(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 7
LDI r2, 153
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
