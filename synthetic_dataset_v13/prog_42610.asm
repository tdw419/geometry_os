; DESCRIPTION: Places a red line segment connecting (430, 170) to (430, 182).
; PLAN: r0=430(x1), r1=170(y1), r2=430(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 170
LDI r2, 430
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
