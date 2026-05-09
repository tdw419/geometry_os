; DESCRIPTION: Places a red line segment connecting (486, 91) to (423, 241).
; PLAN: r0=486(x1), r1=91(y1), r2=423(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 91
LDI r2, 423
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
