; DESCRIPTION: Places a magenta line segment connecting (99, 207) to (102, 110).
; PLAN: r0=99(x1), r1=207(y1), r2=102(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 207
LDI r2, 102
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
