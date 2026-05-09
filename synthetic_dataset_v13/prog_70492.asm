; DESCRIPTION: Places a blue line segment connecting (324, 94) to (470, 194).
; PLAN: r0=324(x1), r1=94(y1), r2=470(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 94
LDI r2, 470
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
