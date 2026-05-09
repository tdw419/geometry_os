; DESCRIPTION: Places a yellow line segment connecting (162, 241) to (390, 76).
; PLAN: r0=162(x1), r1=241(y1), r2=390(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 241
LDI r2, 390
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
