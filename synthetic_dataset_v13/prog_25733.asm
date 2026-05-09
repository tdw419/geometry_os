; DESCRIPTION: Places a red line segment connecting (495, 99) to (5, 34).
; PLAN: r0=495(x1), r1=99(y1), r2=5(x2), r3=34(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 99
LDI r2, 5
LDI r3, 34
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
