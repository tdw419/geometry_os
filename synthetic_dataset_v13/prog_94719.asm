; DESCRIPTION: Places a blue line segment connecting (161, 122) to (395, 127).
; PLAN: r0=161(x1), r1=122(y1), r2=395(x2), r3=127(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 122
LDI r2, 395
LDI r3, 127
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
