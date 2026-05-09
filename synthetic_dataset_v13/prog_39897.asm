; DESCRIPTION: Places a blue line segment connecting (99, 119) to (209, 175).
; PLAN: r0=99(x1), r1=119(y1), r2=209(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 119
LDI r2, 209
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
