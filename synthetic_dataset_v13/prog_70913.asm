; DESCRIPTION: Places a blue line segment connecting (476, 178) to (462, 102).
; PLAN: r0=476(x1), r1=178(y1), r2=462(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 178
LDI r2, 462
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
