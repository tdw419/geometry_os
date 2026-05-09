; DESCRIPTION: Places a magenta line segment connecting (175, 212) to (476, 233).
; PLAN: r0=175(x1), r1=212(y1), r2=476(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 212
LDI r2, 476
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
