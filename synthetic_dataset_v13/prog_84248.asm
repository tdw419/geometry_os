; DESCRIPTION: Places a blue line segment connecting (191, 1) to (2, 149).
; PLAN: r0=191(x1), r1=1(y1), r2=2(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 1
LDI r2, 2
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
