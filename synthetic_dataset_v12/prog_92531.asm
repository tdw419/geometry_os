; DESCRIPTION: Places a blue line segment connecting (1, 15) to (250, 95).
; PLAN: r0=1(x1), r1=15(y1), r2=250(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 15
LDI r2, 250
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
