; DESCRIPTION: Places a yellow line segment connecting (276, 252) to (406, 80).
; PLAN: r0=276(x1), r1=252(y1), r2=406(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 252
LDI r2, 406
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
