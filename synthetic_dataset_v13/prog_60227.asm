; DESCRIPTION: Places a red line segment connecting (407, 252) to (360, 140).
; PLAN: r0=407(x1), r1=252(y1), r2=360(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 252
LDI r2, 360
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
