; DESCRIPTION: Places a yellow line segment connecting (106, 22) to (339, 75).
; PLAN: r0=106(x1), r1=22(y1), r2=339(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 22
LDI r2, 339
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
