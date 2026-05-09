; DESCRIPTION: Places a blue line segment connecting (99, 137) to (154, 123).
; PLAN: r0=99(x1), r1=137(y1), r2=154(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 137
LDI r2, 154
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
