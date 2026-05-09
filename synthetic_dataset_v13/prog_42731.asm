; DESCRIPTION: Places a yellow line segment connecting (366, 3) to (96, 179).
; PLAN: r0=366(x1), r1=3(y1), r2=96(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 3
LDI r2, 96
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
