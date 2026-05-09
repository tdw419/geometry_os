; DESCRIPTION: Places a purple line segment connecting (507, 62) to (19, 198).
; PLAN: r0=507(x1), r1=62(y1), r2=19(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 62
LDI r2, 19
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
