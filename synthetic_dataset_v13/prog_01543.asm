; DESCRIPTION: Places a blue line segment connecting (361, 132) to (344, 60).
; PLAN: r0=361(x1), r1=132(y1), r2=344(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 132
LDI r2, 344
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
