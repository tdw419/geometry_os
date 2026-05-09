; DESCRIPTION: Places a blue line segment connecting (456, 51) to (505, 212).
; PLAN: r0=456(x1), r1=51(y1), r2=505(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 51
LDI r2, 505
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
