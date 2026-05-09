; DESCRIPTION: Places a green line segment connecting (133, 77) to (258, 216).
; PLAN: r0=133(x1), r1=77(y1), r2=258(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 77
LDI r2, 258
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
