; DESCRIPTION: Places a green line segment connecting (164, 22) to (10, 35).
; PLAN: r0=164(x1), r1=22(y1), r2=10(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 22
LDI r2, 10
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
