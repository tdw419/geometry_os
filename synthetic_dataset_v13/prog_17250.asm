; DESCRIPTION: Places a blue line segment connecting (366, 161) to (30, 61).
; PLAN: r0=366(x1), r1=161(y1), r2=30(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 161
LDI r2, 30
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
