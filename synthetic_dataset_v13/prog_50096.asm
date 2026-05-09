; DESCRIPTION: Places a red line segment connecting (106, 105) to (475, 36).
; PLAN: r0=106(x1), r1=105(y1), r2=475(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 105
LDI r2, 475
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
