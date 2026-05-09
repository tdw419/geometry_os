; DESCRIPTION: Places a blue line segment connecting (50, 251) to (84, 178).
; PLAN: r0=50(x1), r1=251(y1), r2=84(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 251
LDI r2, 84
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
