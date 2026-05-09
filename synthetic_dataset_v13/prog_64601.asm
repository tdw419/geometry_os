; DESCRIPTION: Places a yellow line segment connecting (313, 22) to (260, 161).
; PLAN: r0=313(x1), r1=22(y1), r2=260(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 22
LDI r2, 260
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
