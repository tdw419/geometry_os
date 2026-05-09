; DESCRIPTION: Places a yellow line segment connecting (162, 68) to (288, 144).
; PLAN: r0=162(x1), r1=68(y1), r2=288(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 68
LDI r2, 288
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
