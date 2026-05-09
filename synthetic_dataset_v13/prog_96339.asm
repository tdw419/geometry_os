; DESCRIPTION: Places a blue line segment connecting (23, 208) to (112, 123).
; PLAN: r0=23(x1), r1=208(y1), r2=112(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 208
LDI r2, 112
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
