; DESCRIPTION: Places a blue line segment connecting (447, 164) to (140, 212).
; PLAN: r0=447(x1), r1=164(y1), r2=140(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 164
LDI r2, 140
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
