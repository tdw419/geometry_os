; DESCRIPTION: Places a blue line segment connecting (65, 90) to (395, 11).
; PLAN: r0=65(x1), r1=90(y1), r2=395(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 90
LDI r2, 395
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
