; DESCRIPTION: Places a blue line segment connecting (279, 225) to (349, 99).
; PLAN: r0=279(x1), r1=225(y1), r2=349(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 225
LDI r2, 349
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
