; DESCRIPTION: Places a red line segment connecting (15, 2) to (359, 72).
; PLAN: r0=15(x1), r1=2(y1), r2=359(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 2
LDI r2, 359
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
