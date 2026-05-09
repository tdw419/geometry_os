; DESCRIPTION: Places a blue line segment connecting (288, 110) to (456, 28).
; PLAN: r0=288(x1), r1=110(y1), r2=456(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 110
LDI r2, 456
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
