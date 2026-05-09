; DESCRIPTION: Places a magenta line segment connecting (477, 155) to (2, 225).
; PLAN: r0=477(x1), r1=155(y1), r2=2(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 155
LDI r2, 2
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
