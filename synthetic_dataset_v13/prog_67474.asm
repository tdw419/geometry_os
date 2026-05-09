; DESCRIPTION: Places a red line segment connecting (4, 56) to (342, 123).
; PLAN: r0=4(x1), r1=56(y1), r2=342(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 56
LDI r2, 342
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
