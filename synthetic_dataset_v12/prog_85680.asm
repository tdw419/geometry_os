; DESCRIPTION: Places a green line segment connecting (261, 109) to (390, 12).
; PLAN: r0=261(x1), r1=109(y1), r2=390(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 109
LDI r2, 390
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
