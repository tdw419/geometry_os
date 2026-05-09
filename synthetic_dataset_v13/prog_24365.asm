; DESCRIPTION: Places a blue line segment connecting (23, 88) to (272, 158).
; PLAN: r0=23(x1), r1=88(y1), r2=272(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 88
LDI r2, 272
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
