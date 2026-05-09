; DESCRIPTION: Places a red line segment connecting (31, 113) to (44, 81).
; PLAN: r0=31(x1), r1=113(y1), r2=44(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 113
LDI r2, 44
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
