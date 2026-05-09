; DESCRIPTION: Places a red line segment connecting (431, 68) to (435, 104).
; PLAN: r0=431(x1), r1=68(y1), r2=435(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 68
LDI r2, 435
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
