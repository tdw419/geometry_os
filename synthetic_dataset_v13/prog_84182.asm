; DESCRIPTION: Places a red line segment connecting (369, 31) to (37, 84).
; PLAN: r0=369(x1), r1=31(y1), r2=37(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 31
LDI r2, 37
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
