; DESCRIPTION: Places a blue line segment connecting (18, 229) to (279, 104).
; PLAN: r0=18(x1), r1=229(y1), r2=279(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 229
LDI r2, 279
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
