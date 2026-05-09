; DESCRIPTION: Places a magenta line segment connecting (287, 90) to (475, 191).
; PLAN: r0=287(x1), r1=90(y1), r2=475(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 90
LDI r2, 475
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
