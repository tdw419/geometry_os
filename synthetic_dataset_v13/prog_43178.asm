; DESCRIPTION: Places a blue line segment connecting (411, 40) to (450, 26).
; PLAN: r0=411(x1), r1=40(y1), r2=450(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 40
LDI r2, 450
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
