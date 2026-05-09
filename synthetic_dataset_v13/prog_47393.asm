; DESCRIPTION: Places a red line segment connecting (181, 212) to (324, 78).
; PLAN: r0=181(x1), r1=212(y1), r2=324(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 212
LDI r2, 324
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
