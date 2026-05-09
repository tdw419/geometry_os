; DESCRIPTION: Places a green line segment connecting (222, 72) to (118, 35).
; PLAN: r0=222(x1), r1=72(y1), r2=118(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 72
LDI r2, 118
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
