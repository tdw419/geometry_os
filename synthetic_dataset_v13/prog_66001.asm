; DESCRIPTION: Places a green line segment connecting (1, 216) to (87, 165).
; PLAN: r0=1(x1), r1=216(y1), r2=87(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 216
LDI r2, 87
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
