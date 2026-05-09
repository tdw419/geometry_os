; DESCRIPTION: Places a red line segment connecting (423, 190) to (49, 152).
; PLAN: r0=423(x1), r1=190(y1), r2=49(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 190
LDI r2, 49
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
