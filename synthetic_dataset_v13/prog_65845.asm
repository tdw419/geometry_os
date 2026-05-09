; DESCRIPTION: Places a blue line segment connecting (126, 14) to (259, 105).
; PLAN: r0=126(x1), r1=14(y1), r2=259(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 14
LDI r2, 259
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
