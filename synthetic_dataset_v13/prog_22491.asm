; DESCRIPTION: Places a yellow line segment connecting (249, 158) to (155, 108).
; PLAN: r0=249(x1), r1=158(y1), r2=155(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 158
LDI r2, 155
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
