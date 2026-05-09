; DESCRIPTION: Places a yellow line segment connecting (381, 123) to (437, 205).
; PLAN: r0=381(x1), r1=123(y1), r2=437(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 123
LDI r2, 437
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
