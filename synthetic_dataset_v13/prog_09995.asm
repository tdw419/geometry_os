; DESCRIPTION: Places a red line segment connecting (80, 170) to (507, 165).
; PLAN: r0=80(x1), r1=170(y1), r2=507(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 170
LDI r2, 507
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
