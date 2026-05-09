; DESCRIPTION: Places a yellow line segment connecting (389, 188) to (118, 79).
; PLAN: r0=389(x1), r1=188(y1), r2=118(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 188
LDI r2, 118
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
