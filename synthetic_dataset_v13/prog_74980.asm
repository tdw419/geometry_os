; DESCRIPTION: Places a red line segment connecting (162, 80) to (276, 68).
; PLAN: r0=162(x1), r1=80(y1), r2=276(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 80
LDI r2, 276
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
