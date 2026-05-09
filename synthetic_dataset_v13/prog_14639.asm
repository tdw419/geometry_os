; DESCRIPTION: Places a magenta line segment connecting (353, 170) to (161, 155).
; PLAN: r0=353(x1), r1=170(y1), r2=161(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 170
LDI r2, 161
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
