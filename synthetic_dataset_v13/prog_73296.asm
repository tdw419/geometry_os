; DESCRIPTION: Places a blue line segment connecting (466, 22) to (370, 161).
; PLAN: r0=466(x1), r1=22(y1), r2=370(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 22
LDI r2, 370
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
