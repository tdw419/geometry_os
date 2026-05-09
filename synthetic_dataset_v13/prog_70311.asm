; DESCRIPTION: Places a green line segment connecting (89, 198) to (8, 135).
; PLAN: r0=89(x1), r1=198(y1), r2=8(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 198
LDI r2, 8
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
