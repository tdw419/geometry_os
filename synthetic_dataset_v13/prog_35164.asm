; DESCRIPTION: Places a red line segment connecting (252, 110) to (249, 175).
; PLAN: r0=252(x1), r1=110(y1), r2=249(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 110
LDI r2, 249
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
