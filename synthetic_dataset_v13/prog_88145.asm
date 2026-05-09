; DESCRIPTION: Places a green line segment connecting (31, 254) to (145, 216).
; PLAN: r0=31(x1), r1=254(y1), r2=145(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 254
LDI r2, 145
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
