; DESCRIPTION: Places a yellow line segment connecting (366, 1) to (366, 133).
; PLAN: r0=366(x1), r1=1(y1), r2=366(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 1
LDI r2, 366
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
