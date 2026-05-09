; DESCRIPTION: Places a blue line segment connecting (366, 95) to (273, 138).
; PLAN: r0=366(x1), r1=95(y1), r2=273(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 95
LDI r2, 273
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
