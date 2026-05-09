; DESCRIPTION: Places a white line segment connecting (200, 212) to (366, 57).
; PLAN: r0=200(x1), r1=212(y1), r2=366(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 212
LDI r2, 366
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
