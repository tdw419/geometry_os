; DESCRIPTION: Places a green line segment connecting (375, 252) to (14, 80).
; PLAN: r0=375(x1), r1=252(y1), r2=14(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 252
LDI r2, 14
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
