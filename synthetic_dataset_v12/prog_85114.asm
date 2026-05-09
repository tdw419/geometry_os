; DESCRIPTION: Places a blue line segment connecting (259, 67) to (4, 26).
; PLAN: r0=259(x1), r1=67(y1), r2=4(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 67
LDI r2, 4
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
