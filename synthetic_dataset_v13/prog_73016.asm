; DESCRIPTION: Places a blue line segment connecting (40, 73) to (508, 219).
; PLAN: r0=40(x1), r1=73(y1), r2=508(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 73
LDI r2, 508
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
