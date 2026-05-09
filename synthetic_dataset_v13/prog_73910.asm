; DESCRIPTION: Places a blue line segment connecting (18, 80) to (490, 138).
; PLAN: r0=18(x1), r1=80(y1), r2=490(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 80
LDI r2, 490
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
