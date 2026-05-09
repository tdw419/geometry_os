; DESCRIPTION: Places a green line segment connecting (46, 251) to (201, 90).
; PLAN: r0=46(x1), r1=251(y1), r2=201(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 251
LDI r2, 201
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
