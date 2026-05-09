; DESCRIPTION: Places a green line segment connecting (219, 200) to (216, 68).
; PLAN: r0=219(x1), r1=200(y1), r2=216(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 200
LDI r2, 216
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
