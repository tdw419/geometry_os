; DESCRIPTION: Places a yellow line segment connecting (169, 207) to (501, 45).
; PLAN: r0=169(x1), r1=207(y1), r2=501(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 207
LDI r2, 501
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
