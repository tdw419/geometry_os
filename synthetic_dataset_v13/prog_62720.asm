; DESCRIPTION: Places a red line segment connecting (364, 75) to (171, 241).
; PLAN: r0=364(x1), r1=75(y1), r2=171(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 75
LDI r2, 171
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
