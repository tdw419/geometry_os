; DESCRIPTION: Places a yellow line segment connecting (383, 20) to (366, 8).
; PLAN: r0=383(x1), r1=20(y1), r2=366(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 20
LDI r2, 366
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
