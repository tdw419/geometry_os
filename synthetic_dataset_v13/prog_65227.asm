; DESCRIPTION: Places a blue line segment connecting (178, 95) to (315, 66).
; PLAN: r0=178(x1), r1=95(y1), r2=315(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 95
LDI r2, 315
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
