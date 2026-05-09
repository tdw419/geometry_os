; DESCRIPTION: Places a white line segment connecting (55, 160) to (366, 149).
; PLAN: r0=55(x1), r1=160(y1), r2=366(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 160
LDI r2, 366
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
