; DESCRIPTION: Places a blue line segment connecting (45, 205) to (158, 70).
; PLAN: r0=45(x1), r1=205(y1), r2=158(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 205
LDI r2, 158
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
