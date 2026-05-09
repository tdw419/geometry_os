; DESCRIPTION: Places a red line segment connecting (406, 11) to (427, 207).
; PLAN: r0=406(x1), r1=11(y1), r2=427(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 11
LDI r2, 427
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
