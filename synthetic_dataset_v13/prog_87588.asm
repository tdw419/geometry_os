; DESCRIPTION: Places a black line segment connecting (89, 7) to (366, 197).
; PLAN: r0=89(x1), r1=7(y1), r2=366(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 7
LDI r2, 366
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
