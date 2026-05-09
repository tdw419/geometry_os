; DESCRIPTION: Places a blue line segment connecting (91, 89) to (230, 5).
; PLAN: r0=91(x1), r1=89(y1), r2=230(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 89
LDI r2, 230
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
