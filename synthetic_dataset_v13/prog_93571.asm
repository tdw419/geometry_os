; DESCRIPTION: Places a red line segment connecting (55, 6) to (459, 102).
; PLAN: r0=55(x1), r1=6(y1), r2=459(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 6
LDI r2, 459
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
