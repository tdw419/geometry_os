; DESCRIPTION: Places a blue line segment connecting (45, 10) to (175, 158).
; PLAN: r0=45(x1), r1=10(y1), r2=175(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 10
LDI r2, 175
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
