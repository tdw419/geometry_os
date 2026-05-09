; DESCRIPTION: Places a red line segment connecting (432, 104) to (381, 99).
; PLAN: r0=432(x1), r1=104(y1), r2=381(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 104
LDI r2, 381
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
