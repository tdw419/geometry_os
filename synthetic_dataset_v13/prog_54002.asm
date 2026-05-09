; DESCRIPTION: Places a yellow line segment connecting (52, 132) to (366, 36).
; PLAN: r0=52(x1), r1=132(y1), r2=366(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 132
LDI r2, 366
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
