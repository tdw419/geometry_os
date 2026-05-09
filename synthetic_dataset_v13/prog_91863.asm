; DESCRIPTION: Places a red line segment connecting (77, 84) to (505, 30).
; PLAN: r0=77(x1), r1=84(y1), r2=505(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 84
LDI r2, 505
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
