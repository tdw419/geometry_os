; DESCRIPTION: Places a blue line segment connecting (432, 87) to (85, 65).
; PLAN: r0=432(x1), r1=87(y1), r2=85(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 87
LDI r2, 85
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
