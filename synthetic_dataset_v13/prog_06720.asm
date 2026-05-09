; DESCRIPTION: Places a blue line segment connecting (43, 178) to (279, 70).
; PLAN: r0=43(x1), r1=178(y1), r2=279(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 178
LDI r2, 279
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
