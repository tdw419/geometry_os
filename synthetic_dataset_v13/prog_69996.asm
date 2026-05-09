; DESCRIPTION: Places a blue line segment connecting (144, 234) to (476, 102).
; PLAN: r0=144(x1), r1=234(y1), r2=476(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 234
LDI r2, 476
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
