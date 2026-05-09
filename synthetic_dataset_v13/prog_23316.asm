; DESCRIPTION: Places a purple line segment connecting (149, 74) to (205, 198).
; PLAN: r0=149(x1), r1=74(y1), r2=205(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 74
LDI r2, 205
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
