; DESCRIPTION: Places a yellow line segment connecting (162, 170) to (451, 166).
; PLAN: r0=162(x1), r1=170(y1), r2=451(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 170
LDI r2, 451
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
