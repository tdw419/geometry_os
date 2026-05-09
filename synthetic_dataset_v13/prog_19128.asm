; DESCRIPTION: Places a green line segment connecting (130, 158) to (422, 231).
; PLAN: r0=130(x1), r1=158(y1), r2=422(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 158
LDI r2, 422
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
