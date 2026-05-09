; DESCRIPTION: Places a green line segment connecting (377, 144) to (41, 145).
; PLAN: r0=377(x1), r1=144(y1), r2=41(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 144
LDI r2, 41
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
