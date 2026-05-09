; DESCRIPTION: Places a green line segment connecting (451, 28) to (34, 207).
; PLAN: r0=451(x1), r1=28(y1), r2=34(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 28
LDI r2, 34
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
