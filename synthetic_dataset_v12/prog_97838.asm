; DESCRIPTION: Places a blue line segment connecting (2, 208) to (17, 58).
; PLAN: r0=2(x1), r1=208(y1), r2=17(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 208
LDI r2, 17
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
