; DESCRIPTION: Places a blue line segment connecting (470, 200) to (56, 134).
; PLAN: r0=470(x1), r1=200(y1), r2=56(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 200
LDI r2, 56
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
