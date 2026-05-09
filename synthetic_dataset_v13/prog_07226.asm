; DESCRIPTION: Places a yellow line segment connecting (155, 122) to (318, 50).
; PLAN: r0=155(x1), r1=122(y1), r2=318(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 122
LDI r2, 318
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
